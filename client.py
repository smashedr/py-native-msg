import json
import logging
import struct
import sys

log_filename = 'log.txt'
log_level = 'DEBUG'
log_format = '%(asctime)s,%(msecs)d %(name)s %(levelname)s - %(message)s'
log_datefmt = '%Y-%m-%d %H:%M:%S'


logging.basicConfig(
    filename=log_filename,
    filemode='a',
    format=log_format,
    level=logging.getLevelName(log_level),
    datefmt=log_datefmt,
)

logger = logging.getLogger('py-native-msg')


def read_message():
    length = sys.stdin.buffer.read(4)
    if len(length) == 0:
        logger.warning('Message length is 0')
        sys.exit(0)
    message_length = struct.unpack('I', length)[0]
    data = sys.stdin.buffer.read(message_length).decode('utf-8')
    return json.loads(data)


def send_message(data):
    string = json.dumps(data)
    length = struct.pack('@I', len(string))
    msg = {'length': length, 'content': string}
    sys.stdout.buffer.write(msg['length'])
    sys.stdout.write(msg['content'])
    sys.stdout.flush()


try:
    message = read_message()
    logger.debug(message)
    send_message({'message': 'Message from Client.'})

except Exception as error:
    logger.exception(error)

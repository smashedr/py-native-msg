#!/usr/bin/env python3

import json
import logging
import struct
import sys

logging.basicConfig(
    filename='log.txt',
    filemode='a',
    format='%(asctime)s %(name)s %(levelname)s - %(message)s',
    level=logging.getLevelName('DEBUG'),
    datefmt='%Y-%m-%d %H:%M:%S',
)

logger = logging.getLogger('client')


def read_message():
    length = sys.stdin.buffer.read(4)
    if len(length) == 0:
        logger.warning('Message length is 0')
        sys.exit(0)
    message_length = struct.unpack('I', length)[0]
    data = sys.stdin.buffer.read(message_length).decode('utf-8')
    return json.loads(data)


def send_response(data, success=True):
    data['success'] = success
    text = json.dumps(data)
    length = struct.pack('@I', len(text))
    msg = {'length': length, 'content': text}
    sys.stdout.buffer.write(msg['length'])
    sys.stdout.write(msg['content'])
    sys.stdout.flush()


try:
    message = read_message()
    logger.debug(f'message: {message}')
    send_response({'message': 'Host Client Working.'})

except Exception as error:
    logger.exception(error)
    send_response({'message': str(error)}, False)

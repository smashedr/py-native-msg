import json
import os
import platform
# import sys
from typing import Dict, List, Union

data: Dict[Union[str, str], Union[str, List[str]]] = {
    "name": "com.cssnr.extension.python",
    "description": "Python Native Messaging Client",
    "type": "stdio",
}
firefox_ids: List[str] = [
    "web-enhancer@cssnr.com",
]
chrome_ids: List[str] = [
    "nnamkjohdjofgohangnmngbclcbchmpp",
]

# if len(sys.argv) == 1:
#     raise ValueError('Missing Required Argument: client_path')
# client_path = sys.argv[1]

system = platform.system()
if system == 'Windows':
    client_path = 'client.exe'
elif system == 'Linux':
    client_path = f'/opt/{data["name"]}/client.py'
elif system == 'Darwin':
    client_path = f'/opt/{data["name"]}/client.py'
else:
    raise ValueError(f'Unsupported System: {system}')

print(f'Using client path: {client_path}')
data['path'] = client_path
output_dir = 'dist'

manifest_firefox = data.copy()
manifest_firefox['allowed_extensions'] = firefox_ids

manifest_chrome = data.copy()
manifest_chrome['allowed_origins'] = []
for _id in chrome_ids:
    manifest_chrome['allowed_origins'].append(f'chrome-extension://{_id}/')

output_firefox = os.path.join(output_dir, 'manifest-firefox.json')
output_chrome = os.path.join(output_dir, 'manifest-chrome.json')

firefox = json.dumps(manifest_firefox, ensure_ascii=False, indent=2)
chrome = json.dumps(manifest_chrome, ensure_ascii=False, indent=2)

if not os.path.isdir(output_dir):
    os.mkdir(output_dir)

print(f'Writing Firefox to: {output_firefox}\n{firefox}')
with open(output_firefox, 'w', encoding='utf-8') as f:
    f.write(firefox)

print(f'Writing Chrome to: {output_chrome}\n{chrome}')
with open(output_chrome, 'w', encoding='utf-8') as f:
    f.write(chrome)

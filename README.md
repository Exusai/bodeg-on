# bodeg-on

Conectar con simulación en Unity:
- `roslaunch ros_tcp_endpoint endpoint.launch`

Conectar control para control manual en el order picker:
- `rosrun joy joy_node`
- `rosrun orderpicker ControlManual.py`

Iniciar manipulador como servidor (desde `/home/faber/bodeg-on/src/manipulador/src`):
- `python Manipulador/__main__.py`

Web Video Server:
- `rosrun image_transport republish compressed in:=/gripper_cam out:=/image_raw`
- `rosrun web_video_server web_video_server`
- http://localhost:8080/stream_viewer?topic=/image_raw o http://localhost:8080/stream?topic=/image_raw

La UI deberá ser iniciada de otro modo
API:
- `curl -X POST http://0.0.0.0:5000/goToOffloadPoint`

# videos
https://user-images.githubusercontent.com/47704357/170529145-65fb159d-e98d-4a26-a011-6847f195734c.mp4

https://user-images.githubusercontent.com/47704357/170529161-f1be2d1e-a9ba-4278-a159-093f2b93602d.mp4

https://user-images.githubusercontent.com/47704357/170529168-92c62eed-38e0-48e4-a91e-f7dbda7e281e.mp4

https://user-images.githubusercontent.com/47704357/170529178-72fc167c-9dd7-48d2-a71e-a65ee2dd233d.mp4




https://user-images.githubusercontent.com/47704357/170530414-e110a1dc-acf2-4b17-8f04-46f130e872e7.mp4


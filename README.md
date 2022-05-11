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


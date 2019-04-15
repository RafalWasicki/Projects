import paho.mqtt.client as mqtt
import time
import matplotlib.pyplot as plt
import numpy

fig = plt.figure()
ax2 = fig.add_subplot(1,1,1)



Temp = []
czas =[]
def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("connected Ok")
    else:
        print("bad connection Returned cod=",rc)



def on_log(client, userdata, level, buf):
    print("log: "+buf)


def on_disconnect(client, userdata, flags, rc=0):
    print("Disconnected result code "+str(rc))


def on_message(client, userdata, msg):
    m_decode=msg.payload.decode("utf-8")
    print(m_decode)
    b = m_decode.split()
    print(b)

    if float(b[5]) == 0:
        plt.ylim(-15, 35)
        Temp.append(float(b[4]))
        czas.append(b[2])
        plt.xlabel('czas')
        plt.ylabel('temperatura')
        plt.plot(czas, Temp)
        plt.draw()
        plt.pause(0.01)
        plt.clf()
        if len(czas) > 10:
            czas.pop(0)
            Temp.pop(0)






broker = "10.182.218.107"
client = mqtt.Client("Revus")

client.on_connect = on_connect
#client.on_log = on_log
client.on_disconnect = on_disconnect
client.on_message=on_message

print("connecting to broker ", broker)

client.connect(broker,1883,60)

client.subscribe("topic/T2")
client.loop_forever()

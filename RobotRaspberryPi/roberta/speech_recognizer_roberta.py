__author__ = 'jfroeschel'

from ws4py.client.threadedclient import WebSocketClient
import pyaudio
import json

#Your API Key
APIKEY="225ccl9c"

#The Audio Format, Channels, Rate
#Maybe you have to change this to support your microphone
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 44100
#The Chunksize (how much audio is recorded and as chunk send to the server)
CHUNK = 1024

# original # URL="wss://nm-live-speech.iais.fraunhofer.de:443/worker_only_1/"+str(APIKEY)+"/ws/speech?content-type=audio/x-raw,+layout=(string)interleaved,rate=(int)"+str(RATE)+",+format=(string)S16LE,+channels=(int)1"
URL="ws://localhost:8888/worker_only_1/"+str(APIKEY)+"/ws/speech?content-type=audio/x-raw,+layout=(string)interleaved,rate=(int)"+str(RATE)+",+format=(string)S16LE,+channels=(int)1"
# URL="ws://localhost:8888/"+str(APIKEY)+"/ws/speech?content-type=audio/x-raw,+layout=(string)interleaved,rate=(int)"+str(RATE)+",+format=(string)S16LE,+channels=(int)1"
# URL="ws://localhost:8888/ws/speech?content-type=audio/x-raw,+layout=(string)interleaved,rate=(int)"+str(RATE)+",+format=(string)S16LE,+channels=(int)1"
# URL="ws://localhost:8888/speech?content-type=audio/x-raw,+layout=(string)interleaved,rate=(int)"+str(RATE)+",+format=(string)S16LE,+channels=(int)1"



def recognize_speech():
    """This method records an audio stream using pyaudio (ALSA)
    And performs ASR by sending it to the Live ASR Webserver.
    Returns after recognizing a sigle speech segment (word or sentence).

    @rtype:   String
    @return:  The recognized sentence
    """
    print("Starting Speech Recognition")
    #Open the audio input
    audio = pyaudio.PyAudio()
    stream = audio.open(format=FORMAT,
                        channels=CHANNELS,
                        rate=RATE,
                        input=True,
                        frames_per_buffer=CHUNK)
    #Create a Client o the Live ASR Webserver
    client = ASRClient(URL)
    client.connect()
    #Read the audio stream and send it to the server until one sentence was recognized
    while True:
        help=stream.read(CHUNK, exception_on_overflow = False)
        client.send_data(help)
        #Client is finished when a sentence was recognized
        if(client.isFinished()):
            break
    #Return the recognized sentence
    response = str(client.getResponse())
    client.close()
    print("Speech Recognition Finished")
    return response


class ASRClient(WebSocketClient):
    """The asrClient is the Client connecting to the LiveASR Website.
    """

    def __init__(self, url, protocols=None, extensions=None, heartbeat_freq=None):
        super(ASRClient, self).__init__(url, protocols, extensions, heartbeat_freq)
        self.final = False
        self.response=""


    def send_data(self, data):
        """ Send an Audio Stream to the Webserver.

        @type  data: An Audio Stream in the provided FORMAT with
                         given CHANNELS, RATE, CHUNK
        @param data: The Audio Stream
        """
        if data != None:
            self.send(data, binary=True)

    def received_message(self, m):
        """ Received a Message from the Webserver.
        The Message is either an iterim or final result.
        """
        response = json.loads(str(m))
        #If the result is final, set the transcript as response
        self.final = response["result"]["final"]
        if self.final:
            self.response = str(response["result"]["hypotheses"][0]["transcript"])

    def isFinished(self):
        return self.final

    def getResponse(self):
        return self.response

    def opened(self):
        print("Succesfully opened a connection to ASR Server")

    def closed(self, code, reason=None):
        print("Closed the connection to the ASR Server")


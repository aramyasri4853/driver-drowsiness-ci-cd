import cv2

class DrowsinessDetector:
    def __init__(self):
        self.eye_cascade = cv2.CascadeClassifier(
            "app/models/haarcascade_eye.xml"
        )

    def process_frame(self, frame):
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        eyes = self.eye_cascade.detectMultiScale(
            gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30)
        )

        for (x, y, w, h) in eyes:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

        drowsy = len(eyes) == 0
        return drowsy, frame

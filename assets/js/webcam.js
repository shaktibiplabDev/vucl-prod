class Webcam {
    constructor(videoElement, canvasElement) {
        this.videoElement = videoElement;
        this.canvasElement = canvasElement;
        this.stream = null;
        this.picture = '';
    }

    async start() {
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            try {
                this.stream = await navigator.mediaDevices.getUserMedia({ video: true });
                this.videoElement.srcObject = this.stream;
                await this.videoElement.play();
            } catch (err) {
                console.error("Error accessing webcam: ", err);
            }
        } else {
            alert("getUserMedia is not supported in this browser.");
        }
    }

    stop() {
        if (this.stream) {
            this.stream.getTracks().forEach(track => track.stop());
            this.videoElement.srcObject = null;
            this.stream = null;
        }
    }

    capture(type) {
        if (!this.canvasElement) {
            console.error("No canvas element provided for capture.");
            return null;
        }
        const context = this.canvasElement.getContext('2d');
        this.canvasElement.width = this.videoElement.videoWidth;
        this.canvasElement.height = this.videoElement.videoHeight;
        context.drawImage(this.videoElement, 0, 0, this.canvasElement.width, this.canvasElement.height);
        this.picture = this.canvasElement.toDataURL(`image/${type}`);
    }
}

function base64ToFile(base64String, filename) {
    // Split the Base64 string into data and content type
    const arr = base64String.split(',');
    const mime = arr[0].match(/:(.*?);/)[1];
    const bstr = atob(arr[1]);

    // Create a Uint8Array from the binary string
    let n = bstr.length;
    const u8arr = new Uint8Array(n);

    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }

    // Create and return the File object
    return new File([u8arr], filename, { type: mime });
}
  
function setFileInput(fileInputElement, file) {
    // Create a new DataTransfer object
    const dataTransfer = new DataTransfer();

    // Add the file to the DataTransfer object
    dataTransfer.items.add(file);

    // Set the files property of the input element
    fileInputElement.files = dataTransfer.files;

    // Trigger change event if needed
    fileInputElement.dispatchEvent(new Event('change'));
}
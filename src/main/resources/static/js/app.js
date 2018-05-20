function unixTimeToDate(date) {
    var theDate = date;
    var timestamp = moment.unix(theDate);
    return timestamp.format("DD.MM.YYYY hh:mm");
};

function fileCheck(idInputFile, idErrorLabel, idLabelFileName) {
    var inputFile = document.getElementById(idInputFile);
    var errorLabel = document.getElementById(idErrorLabel);
    var labelFileName = document.getElementById(idLabelFileName);

    var fileName = inputFile.files.item(0).name;
    var fileSize = inputFile.files.item(0).size;
    //still is not realised
    //var fileType = inputFile.files.item(0).type;
    var countKb = Math.round((fileSize / 1024));

    if (countKb > limitationFileSizeImage) {
        errorLabel.innerHTML = 'The file is too big. The maximum size is 200 KB.';
        errorLabel.style.display = "block";
        inputFile.value = "";
        labelFileName.innerHTML = "Add file";
    } else {
        errorLabel.style.display = "none";
        labelFileName.innerHTML = fileName;
    }
};
function unixTimeToDate(date) {
    var theDate = date;
    var timestamp = moment.unix(theDate);
    return timestamp.format("DD.MM.YYYY hh:mm");
};

function clickTag(strTag) {
    var tag = strTag;
    console.log(tag);
};
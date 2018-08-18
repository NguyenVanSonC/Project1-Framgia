function increaseValue(id) {
    var str = 'number-'+id;
    var value = parseInt(document.getElementById(str).value, 10);
    value = isNaN(value) ? 0 : value;
    value++;
    document.getElementById(str).value = value;
}

function decreaseValue(id) {
    var str = 'number-'+id;
    var value = parseInt(document.getElementById(str).value, 10);
    value = isNaN(value) ? 0 : value;
    value < 1 ? value = 1 : '';
    value--;
    document.getElementById(str).value = value;
}

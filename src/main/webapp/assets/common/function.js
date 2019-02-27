function guid() {
    function S4() {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    }
    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}
function calcTabelCellWidth(perc) {
    var winwidth =document.documentElement.clientWidth;
    return perc * winwidth;
}
function add0(m){return m<10?'0'+m:m }
function format(shijianchuo) {
//shijianchuo是整数，否则要parseInt转换
    var time = new Date(shijianchuo);
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    /*var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();*/
    return y+'-'+add0(m)+'-'+add0(d);
}
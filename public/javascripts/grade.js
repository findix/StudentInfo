/**
 * Created by Sean on 2014/7/6.
 */
var update = function (_id) {
    $('#form').attr('action', '/grade/update/' + _id);
    $('#modal-title').text('修改成绩');
    var id = '#' + _id;
    $('#cno').val($($(id + ' td')[0]).text());
    $('#cname').val($($(id + ' td')[1]).text());
    $('#score').val($($(id + ' td')[4]).text());
};
var add = function () {
    $('#form').attr('action', '/grade/add');
    $('#modal-title').text('添加成绩');
    cno.options[0].selected=true;
    cname.options[0].selected=true;
    $('#score').val($($(id + ' td')[4]).text());
};
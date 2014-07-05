/**
 * Created by Sean on 2014/7/5.
 */
var update = function (_id) {
    $('#form').attr('action', '/student/update/' + _id);
    $('#modal-title').text('修改学生信息');
    var id = '#' + _id;
    $('#sno').val($($(id + ' td')[0]).text());
    $('#sname').val($($(id + ' td')[1]).text());
    if ($($(id + ' td')[2]).text() == '男') {
        $('input[id=gender]')[0].checked = true;
    } else {
        $('input[id=gender]')[1].checked = true;
    }
    $('#class').val($($(id + ' td')[3]).text());
    $('#department').val($($(id + ' td')[4]).text());
    $('#birthday').val($($(id + ' td')[5]).text());
};
var add = function () {
    $('#form').attr('action', '/student/add');
    $('#modal-title').text('添加学生信息');
    $('#sno').val('');
    $('#sname').val('');
    $('input[id=gender]')[0].checked = true;
    $('#class').val('');
    $('#department').val('');
    $('#birthday').val('');
};
/**
 * Created by LL on 2014/7/6.
 */
var update = function (_id) {
    $('#form').attr('action', '/course/update/' + _id);
    $('#modal-title').text('修改课程');
    var id = '#' + _id;
    $('#cno').val($($(id + ' td')[0]).text());
    $('#cname').val($($(id + ' td')[1]).text());
    $('#credit').val($($(id + ' td')[2]).text());
    $('#teacher').val($($(id + ' td')[3]).text());
};
var add = function () {
    $('#form').attr('action', '/course/add');
    $('#modal-title').text('添加课程');
    $('#cno').val('');
    $('#cname').val('');
    $('#credit').val('');
    $('#teacher').val('');
};
$(function () {
    var arr = $('tr .average');
    for (var i = 0; i < arr.length; i++) {
        (function(j){
            $.ajax({
                    url: '/grade/average/' + $(arr[j]).attr('data-id'),
                    success: function (data) {
                        $(arr[j]).html(data);
                    }
                }
            );
        })(i);

    }
});
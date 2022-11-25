(function () {
    'use strict';

    var treeviewMenu = $('.app-menu')

    // Toggle Sidebar
    $('[data-toggle="sidebar"]').click(function (e) {
        e.preventDefault()
        $('.app').toggleClass('sidenav-toggled')
    });

    // Activate sidebar treeview toggle
    $("[data-toggle='treeview']").click(function (e) {
        e.preventDefault();
        if (!$(this).parent().hasClass('is-expanded')) {
            treeviewMenu.find("[data-toggle='treeview']").parent().removeClass('is-expanded')
        }
        $(this).parent().toggleClass('is-expanded');
    });

    // Set initial active toggle
    $("[data-toggle='treeview.'].is-expanded").parent().toggleClass('is-expanded')

    // Activate bootstrip tooltips
    $("[data-toggle='tooltip']").tooltip()

    // Check all
    $('#all').click(function () {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    // Search
    $(document).ready(function () {
        $('#search').on('input', function () {
            var value = $(this).val().toLowerCase();
            $('#sampleTable tbody tr').filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            })
            let rows = $('#sampleTable tr:visible').length
            $('.search-bar span.quantity').html(String(rows - 1))
        })
    })

    // Remove row
    $(function () {
        $('.trash').click(function () {
            swal({
                title: 'Cảnh báo',
                text: 'Bạn có chắc chắn là muốn xóa sản phẩm này?',
                buttons: ['Hủy bỏ', 'Đồng ý'],
            })
                .then((agree) => {
                    if (agree) {
                        $(this).closest('tr').remove()  // remove row
                        swal({
                            text: 'Đã xóa thành công.',
                            icon: 'success',
                            timer: 1000,
                            buttons: false
                        });
                    }
                });
        });
    });

})();

function validateFormChangePass() {
    var x = document.forms["form-change-pass"]["old-pass"].value;
    var y = document.forms["form-change-pass"]["new-pass"].value;
    var z = document.forms["form-change-pass"]["retype-new-pass"].value;
    if (x == "" || y == "" || z == "") {
        alert("Hay nhap day du thong tin ^.^");
        return false;
    }
}

function validateFormLogin() {

    var x = document.forms["form-login"]["username"].value;
    var y = document.forms["form-login"]["password"].value;
    if (x == "" || y == "") {
        alert("Hay nhap day du thong tin ^.^");
        return false;
    }

}

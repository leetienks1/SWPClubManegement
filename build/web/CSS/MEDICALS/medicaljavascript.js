/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
        $(this).toggleClass('active');
    });

    function toggleCloseAddform() {
        $("#add-form").toggle();
    }

    function toggleOpenAdd() {
        $("#add-form").toggle();
    }



    function toggleOpenEdit() {
        $("#edit-form").toggle();
    }
    function toggleCloseEdit() {
        $("#edit-form").toggle();
    }

    $("#add-close").click(function () {
        toggleCloseAddform();
    });

    $("#add-button").click(function () {
        toggleOpenAdd();
    });
    $(".update-button").click(function () {
        toggleOpenEdit();
    });
    $("#close-edit").click(function () {
        toggleCloseEdit();
    });
    // Display success message if it exists
    openEdit();
    setTimeout(function () {
        var successMessage = document.getElementById('successMessage');
        var Message = "${Message}";

        if (Message !== "") {
            successMessage.style.display = 'none';
            console.log(deleteMessage);
        }
//                                                    if (openMessage == "")
//                                                    {
//                                                        successMessage.style.display = 'none';
//                                                        console.log(openMessage);
//                                                    }
    }, 800);

    function openEdit() {
        var editForm = document.getElementById('edit-form');
        var successMessage = document.getElementById('successMessage');
        var Message = "${Message}";

        var openMessage = "${openEdit}";
        if (openMessage != "")
        {
            editForm.style.display = "block";
        }
        if (Message == "" && openMessage != "")
        {
            successMessage.style.display = 'none';
        }
    }

    setTimeout(() => {
        fetch('/SWPClubManegement/RemoveSessionSuccess', {method: 'DELETE'})
                .then(response => response.text())
                .then(data => {
                    console.log(data);

                })
                .catch(error => console.error('Error:', error));
    }, 1000);
});


// document.addEventListener("DOMContentLoaded", function () {
//     var date = new Date(Date.now() + 86400e3);
//     date = date.toUTCString();
//     // setCookie.onclick = function (event) {
//     //     document.cookie = "popup=true; expires=" + date;
//     //     bg_popup.style.display = "none";
//     // };
//
//     if (document.cookie.match('popup')) {
//         bg_popup.style.display = "none";
//     }
//     else {
//         bg_popup.style.display = "flex";
//         setTimeout(function () {
//                 document.cookie = "popup=true; expires=" + date;
//                 bg_popup.style.display = "none";
//             },
//             15000
//         );
//     }
// });
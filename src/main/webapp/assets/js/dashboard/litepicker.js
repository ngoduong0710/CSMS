// Litepicker
// 
// The date pickers in Material Admin Pro
// are powered by the Litepicker plugin.
// Litepicker is a lightweight, no dependencies
// date picker that allows for date ranges
// and other options. For more usage details
// visit the Litepicker docs.
// 
// Litepicker Documentation
// https://wakirin.github.io/Litepicker



window.addEventListener('DOMContentLoaded', event => {

    new Litepicker({
        element: document.getElementById('litepickerRangePlugin'),
        startDate: new Date(),
        endDate: new Date(),
        singleMode: false,
        numberOfMonths: 2,
        numberOfColumns: 2,
        format: 'MMM DD, YYYY'
    })
});

$(function () {
    $('a.test').on('click', function () {
        var a = $('#litepickerRangePlugin').val();
        alert(a);
    });
});
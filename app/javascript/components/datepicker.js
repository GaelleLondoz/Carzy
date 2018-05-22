import "bootstrap-datepicker";
import $ from 'jquery';

console.log($('.datepicker'));
$('.datepicker').datepicker();

$('.input-daterange input').each(function() {
    $(this).datepicker('clearDates');
});

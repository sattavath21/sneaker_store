// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function downloadCsv(data, filename) {
    var csv = '';
    var headers = Object.keys(data[0]);

    // Add the headers to the CSV
    csv += headers.join(',') + '\n';

    // Add the data to the CSV
    data.forEach(function(item) {
        headers.forEach(function(header) {
            csv += item[header] + ',';
        });
        csv += '\n';
    });

    // Create a link and trigger the download
    var link = document.createElement('a');
    link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv));
    link.setAttribute('download', filename || 'sale.csv');
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}


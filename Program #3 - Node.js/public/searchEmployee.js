function searchEmployeeByFirstName() {
    //Get the first name
    var first_name_search_str = document.getElementById('first_name_search_str').value
    
    //Construct the URL and redirect it
    if (first_name_search_str !== '') {
        window.location = '/employee/search/' + encodeURI(first_name_search_str);
    } else {
        window.location = '/employee/';
    }
}

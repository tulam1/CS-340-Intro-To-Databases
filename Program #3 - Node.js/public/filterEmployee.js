function filterEmployeeByProject() {
  //Get the Pno of the selected project from the filter dropdown
  var project_pno = document.getElementById('project_filter').value
  
  //Construct the URL and redirect it
  window.location = '/employee/filter/' + parseInt(project_pno)
}

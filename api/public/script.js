function toggleTable(tableName) {
  const tableDiv = document.getElementById(`table-${tableName}`);
  const header = tableDiv.previousElementSibling;

  if (tableDiv.style.display === "none") {
    tableDiv.style.display = "block";
    header.innerHTML = "▼ " + tableName + " (" + tableDiv.querySelectorAll("tr").length + " registros)";
  } else {
    tableDiv.style.display = "none";
    header.innerHTML = "▶ " + tableName + " (" + tableDiv.querySelectorAll("tr").length + " registros)";
  }
}
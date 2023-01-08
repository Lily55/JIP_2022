var count = 0

function getData(){
    var name = document.getElementById('name').value
    var cost = document.getElementById('cost').value
    if (cost == '' || name == '' || !priceValidator(cost)) {
        alert('Некорректный ввод');
        return;}
    new_row()
}

function new_row(){
    var main_table = document.getElementById('maintable')
    var td0 = document.createElement('td')
    td0.innerHTML = count
    count++
    var td1 = document.createElement('td')
    td1.innerHTML = name
    var td2 = document.createElement('td')
    td2.innerHTML = cost
    var new_row = document.createElement('tr')
    new_row.appendChild(td0)
    new_row.appendChild(td1)
    new_row.appendChild(td2)
    main_table.appendChild(new_row)
}

function mouseOver(el){
    el.style.backgroundColor = "green";
}

function mouseOut(el){
    el.style.backgroundColor = "yellow";
}

function get_row(el){
    var main_table = document.getElementById('maintable')
    var td0 = document.createElement('td')
    td0.innerHTML = count
    count++
    var td1 = document.createElement('td')
    td1.innerHTML = el.firstChild.nextSibling
    var td2 = document.createElement('td')
    td2.innerHTML = el.firstChild.nextSibling.nextSibling.value
    var new_row = document.createElement('tr')
    new_row.appendChild(td0)
    new_row.appendChild(td1)
    new_row.appendChild(td2)
    main_table.appendChild(new_row)  
}

function priceValidator(cost) {
    var pattern = '[1-9][0-9]?';
    var res = cost.match(pattern);
    return (res != null && res.index == 0) ? true : false;
}
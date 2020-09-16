function chooseOptionLeft() {
    document.getElementById('option-left-choose').style.display='block';
    document.getElementById('option-right-choose').style.display='none';
}

function chooseOptionRight() {
    document.getElementById('option-right-choose').style.display='block';
    document.getElementById('option-left-choose').style.display='none';
}

function cityB() {
    document.getElementById('mienBacCity').style.display='block';
    document.getElementById('mienTrungCity').style.display='none';
    document.getElementById('mienNamCity').style.display='none';
}

function cityT() {
    document.getElementById('mienTrungCity').style.display='block';
    document.getElementById('mienBacCity').style.display='none';
    document.getElementById('mienNamCity').style.display='none';
}

function cityN() {
    document.getElementById('mienNamCity').style.display='block';
    document.getElementById('mienTrungCity').style.display='none';
    document.getElementById('mienBacCity').style.display='none';
}
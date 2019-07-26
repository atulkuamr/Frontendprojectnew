
function starplus() {
    var a = document.getElementById("starrating").value;
    if (a < 5) {
        a++;
        document.getElementById("starrating").value = a;
    }
}

function starmin() {
    var a = document.getElementById("starrating").value;
    if (a > 1) {
        a--;
        document.getElementById("starrating").value = a;
    }
}


/* hotel add and remove function*/



function addrooms() {
    debugger; //1
    var room_count = document.getElementById('rooms').value;
    if (room_count < 4) {
        room_count++;
        document.getElementById("rooms").value = room_count;
        if (room_count == 1) {
            document.getElementById('room1').style.display = "block";
        }
        else if (room_count == 2) {
            document.getElementById('room2').style.display = "block";
        }
        else if (room_count == 3) {
            document.getElementById('room3').style.display = "block";
        }
        else if (room_count == 4) {
            document.getElementById('room4').style.display = "block";
        }
        else { }
    }
}

function minrooms() {
    debugger; //1
    var room_count = document.getElementById("rooms").value;
    if (room_count > 1) {
        room_count--;
        document.getElementById("rooms").value = room_count;
        if (room_count == 1) {
            document.getElementById('room1').style.display = "block";
            document.getElementById('room2').style.display = "none";
            document.getElementById('room3').style.display = "none";
            document.getElementById('room4').style.display = "none";
        }
        else if (room_count == 2) {
            document.getElementById('room1').style.display = "block";
            document.getElementById('room2').style.display = "block";
            document.getElementById('room3').style.display = "none";
            document.getElementById('room4').style.display = "none";
        }
        else if (room_count == 3) {
            document.getElementById('room1').style.display = "block";
            document.getElementById('room2').style.display = "block";
            document.getElementById('room3').style.display = "block";
            document.getElementById('room4').style.display = "none";
        }
        else {
            document.getElementById('room1').style.display = "block";
            document.getElementById('room2').style.display = "block";
            document.getElementById('room3').style.display = "block";
            document.getElementById('room4').style.display = "block";
        }
    }
}



function radult_plus(asv) {
    debugger;
    var abc = asv.id.split('_')[0];
    if (document.getElementById(abc).value < 6) {
        document.getElementById(abc).value = parseInt(document.getElementById(abc).value) + 1;
    }
}

function radult_minus(asv) {
    var abc = asv.id.split('_')[0];
    if (document.getElementById(abc).value > 1) {
        document.getElementById(abc).value = parseInt(document.getElementById(abc).value) - 1;
    }
}



function childageadd(abc) {
    debugger;
    var IDDATA = abc.id;
    datavalue = parseInt(document.getElementById('R_' + abc.id.split('_')[1]).value);
    if (datavalue < 2) {
        document.getElementById('c_' + abc.id.split('_')[1] + '_' + (datavalue + 1)).style.display = "block";
        document.getElementById('R_' + abc.id.split('_')[1]).value = (datavalue + 1);
    }
}
function childagemin(abc) {
    var IDDATA = abc.id;
    datavalue = parseInt(document.getElementById('R_' + abc.id.split('_')[1]).value);
    if (datavalue > -1) {
        document.getElementById('c_' + abc.id.split('_')[1] + '_' + (datavalue)).style.display = "none";
        document.getElementById('R_' + abc.id.split('_')[1]).value = (datavalue - 1);
    }
}

function removeage(abc) {
    debugger;
    var ID = abc.id;
    var a = document.getElementById(abc).value;
    if (a > 1) {
        a--;
        document.getElementById(abc).value = a;
    }
}
function addage(abc) {

    var ID = abc.id;
    var a = document.getElementById(abc).value;
    if (a < 14) {
        a++;
        document.getElementById(abc).value = a;
    }
}





function chplus() {

    var a = document.getElementById("Optchild").value;
    var cata = parseInt(document.getElementById("optAdult").value) + parseInt(document.getElementById("OptInfant").value);
    var childcount = parseInt(parseInt(9) - parseInt(cata));
    if (a < childcount) {
        a++;
        document.getElementById("Optchild").value = a;

        document.getElementById('totalpax').value = parseInt(document.getElementById('totalpax').value) + 1;
    }


}




function chmin() {

    var a = document.getElementById("Optchild").value;

    if (a > 0) {
        a--;
        document.getElementById("Optchild").value = a;
    }

    var b = document.getElementById("xChildren1").value;
    if (b > 0) {
        b--;
        document.getElementById("xChildren1").value = b;
    }

}




function ageplus() {
  
    var a = document.getElementById("optAdult").value;
    if (a < 9) {
        a++;
        document.getElementById("optAdult").value = a;
    }
}

function agemin() {

    var cata = parseInt(document.getElementById("optAdult").value) + parseInt(document.getElementById("OptInfant").value);
    var a = document.getElementById("optAdult").value;
    if (a > 1) {
        a--;
        document.getElementById("optAdult").value = a;
        if (cata>9) {
            if (document.getElementById("OptInfant").value > document.getElementById("optAdult").value) {
                document.getElementById("OptInfant").value = a;
            }
        } else {

        }
        


    }
}




function infantplus() {
    debugger;
    var a = document.getElementById("OptInfant").value;
    if (a < document.getElementById("optAdult").value) {
        a++;
        document.getElementById("OptInfant").value = a;
    }


}


function infantmin() {

    var a = document.getElementById("OptInfant").value;

    if (a > 0) {
        a--
        document.getElementById("OptInfant").value = a;
    }

    var b = document.getElementById("xInfant1").value;
    if (b > 0) {
        b--
        document.getElementById("xInfant1").value = b;
    }
}


function onetrip() {

    document.getElementById('rdata').style.display = 'none';
}

function roundtrip() {

    document.getElementById('rdata').style.display = 'block';
}



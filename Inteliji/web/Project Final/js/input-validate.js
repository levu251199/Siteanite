function checkEmail(){
    var email = document.getElementById("email");
    var blankEmail = document.getElementById("blank-email");
    var check = document.getElementById("check-email");
    var emailCheck = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    // When the user clicks on the email field, show the message box
    email.onfocus = function() {
        document.getElementById("email-validate").style.display = "block";
    }
    // When the user clicks outside of the email field, hide the message box
    email.onblur = function() {
        document.getElementById("email-validate").style.display = "none";
    }
    email.onkeyup = function() {
        //Validate format
        if(emailCheck.test(email.value)) {
            check.classList.remove("invalid");
            check.classList.add("valid");
        } else {
            check.classList.remove("valid");
            check.classList.add("invalid");
        }

        // Validate blank
        if(email.value.length >= 1) {
            blankEmail.classList.remove("invalid");
            blankEmail.classList.add("valid");
        } else {
            blankEmail.classList.remove("valid");
            blankEmail.classList.add("invalid");
        }
    }
}

function checkEmailRetype(){
    var emailInput = document.getElementById("email");
    var email = document.getElementById("email-retype");
    var blankEmail = document.getElementById("blank-email-retype");
    var check = document.getElementById("check-email-retype");
    // When the user clicks on the email field, show the message box
    email.onfocus = function() {
        document.getElementById("email-retype-validate").style.display = "block";
    }
    // When the user clicks outside of the email field, hide the message box
    email.onblur = function() {
        document.getElementById("email-retype-validate").style.display = "none";
    }
    email.onkeyup = function() {
        //Validate format
        if(email.value === emailInput.value) {
            check.classList.remove("invalid");
            check.classList.add("valid");
        } else {
            check.classList.remove("valid");
            check.classList.add("invalid");
        }

        // Validate blank
        if(email.value.length >= 1) {
            blankEmail.classList.remove("invalid");
            blankEmail.classList.add("valid");
        } else {
            blankEmail.classList.remove("valid");
            blankEmail.classList.add("invalid");
        }
    }
}

function checkPass(){
    var pass = document.getElementById("pass");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");
    // When the user clicks on the password field, show the message box
    pass.onfocus = function() {
        document.getElementById("pass-validate").style.display = "block";
    }
    // When the user clicks outside of the password field, hide the message box
    pass.onblur = function() {
        document.getElementById("pass-validate").style.display = "none";
    }
    // When the user starts to type something inside the password field
    pass.onkeyup = function() {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if(pass.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if(pass.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if(pass.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if(pass.value.length >= 1) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }
}

function checkPassRetype(){
    var passInput = document.getElementById("pass");
    var pass = document.getElementById("pass-retype");
    var blankPass = document.getElementById("blank-pass-retype");
    var check = document.getElementById("check-pass-retype");
    // When the user clicks on the email field, show the message box
    pass.onfocus = function() {
        document.getElementById("pass-retype-validate").style.display = "block";
    }
    // When the user clicks outside of the email field, hide the message box
    pass.onblur = function() {
        document.getElementById("pass-retype-validate").style.display = "none";
    }
    pass.onkeyup = function() {
        //Validate format
        if(pass.value === passInput.value) {
            check.classList.remove("invalid");
            check.classList.add("valid");
        } else {
            check.classList.remove("valid");
            check.classList.add("invalid");
        }

        // Validate blank
        if(pass.value.length >= 1) {
            blankPass.classList.remove("invalid");
            blankPass.classList.add("valid");
        } else {
            blankPass.classList.remove("valid");
            blankPass.classList.add("invalid");
        }
    }
}

function checkLastName(){
    var lastName = document.getElementById("last-name");
    var blankLastName = document.getElementById("blank-last-name");
    // When the user clicks on the email field, show the message box
    lastName.onfocus = function() {
        document.getElementById("last-name-validate").style.display = "block";
    }
    // When the user clicks outside of the email field, hide the message box
    lastName.onblur = function() {
        document.getElementById("last-name-validate").style.display = "none";
    }
    lastName.onkeyup = function() {
        // Validate blank
        if(lastName.value.length >= 1) {
            blankLastName.classList.remove("invalid");
            blankLastName.classList.add("valid");
        } else {
            blankLastName.classList.remove("valid");
            blankLastName.classList.add("invalid");
        }
    }
}

function checkFirstName(){
    var firstName = document.getElementById("first-name");
    var blankFirstName = document.getElementById("blank-first-name");
    // When the user clicks on the email field, show the message box
    firstName.onfocus = function() {
        document.getElementById("first-name-validate").style.display = "block";
    }
    // When the user clicks outside of the email field, hide the message box
    firstName.onblur = function() {
        document.getElementById("first-name-validate").style.display = "none";
    }
    firstName.onkeyup = function() {
        // Validate blank
        if(firstName.value.length >= 1) {
            blankFirstName.classList.remove("invalid");
            blankFirstName.classList.add("valid");
        } else {
            blankFirstName.classList.remove("valid");
            blankFirstName.classList.add("invalid");
        }
    }
}
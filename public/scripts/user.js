if (localStorage.getItem('login') && localStorage.getItem('secret')) {
    axios.post('/api/login', {
        user_name: localStorage.getItem('login'),
        user_password: localStorage.getItem('secret'),
    }).then((res) => {
        if (res.data.error) {
            localStorage.setItem('login', '');
            localStorage.setItem('secret', '');
        } else {
            window.location.href = '/dashboard.html';
        }
    });
}

document.getElementById('loginButton').addEventListener('click', (event) => {
    event.preventDefault();
    let userName = document.getElementById('loginUsername').value;
    let userPassword = document.getElementById('loginPassword').value;
    if ((!userName || userName == '') || (!userPassword || userPassword == '')) {
        return alert('Please Fill in your details !');
    }
    axios.post('/api/login', {
        user_name: userName,
        user_password: userPassword,
    }).then((res) => {
        if (res.data.error) {
            return alert('Invaild Login');
        } else {
            localStorage.setItem('login', userName);
            localStorage.setItem('secret', userPassword);
            localStorage.setItem("user_id", res.data.user_id)
            window.location.href = '/dashboard.html';
        }
    });
});

document.getElementById('signupButton').addEventListener('click', (event) => {
    event.preventDefault();
    password = document.getElementById('password').value;
    userName = document.getElementById('userName').value;
    userPhone = document.getElementById('userPhone').value;
    userAddress = document.getElementById('userAddress').value;
    if ((!password || password == '') || (!userName || userName == '') || (!userPhone || userPhone == '') || (!userAddress || userAddress == '')) {
        return alert('Please Fill in your details !');
    }
    axios.post('/api/signup', {
        user_name: userName,
        user_password: password,
        user_phone: userPhone,
        user_address: userAddress,
    }).then((res) => {
        if (res.data.error) {
            return alert("User already exists!");
        } else {
            alert('User Creation Successful !');
            localStorage.setItem('login', userName);
            localStorage.setItem('secret', password);
            localStorage.setItem('user_id', res.data.user_id);
            window.location.href = '/dashboard.html';
        }
    });
});
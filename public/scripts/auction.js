if (!localStorage.getItem('login') || !localStorage.getItem('secret')) {
    window.location.href = '/user.html';
}

if (localStorage.getItem('login') && localStorage.getItem('secret')) {
    axios.post('/api/login', {
        user_name: localStorage.getItem('login'),
        user_password: localStorage.getItem('secret'),
    }).then((res) => {
        if (res.data.error) {
            localStorage.setItem('login', '');
            localStorage.setItem('secret', '');
            window.location.href = '/user.html';
        } else {
            // username
            axios.post('/api/userData', {
                user_name: localStorage.getItem('login'),
                user_password: localStorage.getItem('secret'),
            }).then((userData) => {
                if (userData.data.error) {
                    localStorage.setItem('login', '');
                    localStorage.setItem('secret', '');
                    window.location.href = '/user.html';
                } else {
                    document.getElementById('userName').innerText = userData.data.name;
                }
            });

            // show auction data!
            let paramString = document.location.href.split('?')[1];
            let queryString = new URLSearchParams(paramString);
            axios.post('/api/getSingleAuction', {
                product_id: queryString.get('id'),
            }).then((res) => {
                document.getElementById('name').innerText = " " + res.data.data[0];
                document.getElementById('description').innerText = " " + res.data.data[1];
                document.getElementById('minBid').innerText += " " + res.data.data[2];
                document.getElementById('soldBy').innerText += " " + res.data.data[9];
                document.getElementById('startTime').innerText += " " + new Date(res.data.data[3]).toGMTString();
            });
            document.getElementById('loading').remove();
        }
    });
}
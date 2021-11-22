/* globals Chart:false, feather:false */

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
            axios.post('/api/userData', {
                user_name: localStorage.getItem('login'),
                user_password: localStorage.getItem('secret'),
                user_id:localStorage.getItem('user_id'),
            }).then((userData) => {
                if (userData.data.error) {
                    localStorage.setItem('login', '');
                    localStorage.setItem('secret', '');
                    window.location.href = '/user.html';
                } else {
                    document.getElementById('userName').innerText = userData.data.name;
                    document.getElementById('userPhone').innerText = userData.data.phone;
                    //document.getElementById('userEmail').innerText = userData.data.email || userData.data.name;
                    document.getElementById('userAddress').innerText = userData.data.address;
                }
            });
        }
    });
} else {
    window.location.href = '/user.html';
}

document.getElementById('dropdownMenuLink').addEventListener('hide.bs.dropdown', (e) => {
  const attr = e.clickEvent.target.textContent;
  axios.post('/api/besthouses', {
        items: parseInt(attr)
    }).then((res) => {
        if (res.data.error) {
            //console.log(res);
        } else {
            document.getElementById('tableId').innerHTML = "";
            document.getElementById('tableId').innerHTML += 
            `
            <tr>
                <th scope="col">${res.data.besthouseslist[0][0]}</th>
                <th scope="col">${res.data.besthouseslist[0][1]}</th>
                <th scope="col">${res.data.besthouseslist[0][2]}</th>
                <th scope="col">${res.data.besthouseslist[0][3]}</th>
                <th scope="col">${res.data.besthouseslist[0][4]}</th>
            </tr>
            `
            res.data.besthouseslist.map((item, id) => {
                if (id !== 0) {
                    document.getElementById('tableId').innerHTML += 
                `
                <tr>
                    <td scope="row">${item[0]}</td>
                    <td scope="row">${item[1]}</td>
                    <td scope="row">${item[2]}</td>
                    <td scope="row">${item[3]}</td>
                    <td scope="row">${item[4]}</td>
                </tr>
                `
                }                
            })            
        }
    });
})

document.getElementById('signout').addEventListener('click', (e) => {
    localStorage.removeItem('login');
    localStorage.removeItem('secret');
    localStorage.removeItem("user_id");
    window.location.href = '/user.html';
});  

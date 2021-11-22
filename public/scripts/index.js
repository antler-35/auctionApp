var exampleModal = document.getElementById('exampleModal')

function wishlist() {
    console.log('si wishlist');
    const id = this.getAttribute("value");
    axios.post('/api/user_like_a_product', {
        user_id: localStorage.getItem("user_id"),
        product_id: id,
    }).then((data) => {
        alert(data.data.message);
    }).catch((error) => {
        console.log(error);
    })
}

function removeProduct() {
    const productId = this.getAttribute("value");
    axios.post('/api/user_dislike_a_product', {
        user_id: localStorage.getItem("user_id"),
        product_id: productId,
    }).then((data) => {
        alert(data.data.message);
    }).catch((error) => {
        console.log(error);
    })
}

exampleModal.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    const ProductName = button.parentElement.firstElementChild;
    const submitButton = document.getElementById("makeBid");
    const price = document.getElementById("message-text");

    document.getElementById("recipient-name").setAttribute("value", localStorage.getItem("login"));
    document.getElementById("product-name").setAttribute("value", ProductName.innerText.replace("Product_Name:", ""));

    submitButton.addEventListener("click",
        () => {            
            axios.post('/api/place_bid', {
                user_id: localStorage.getItem("user_id"),
                product_id: button.getAttribute("value"),
                price: price.value,
            }).then((data) => {
                // modalTitle.textContent = data.data.data;
                alert(data.data.data);
                document.getElementById('userBalance').innerHTML = `Balance: ${data && data.data && data.data.balance ? data.data.balance : 0}`;
            }).catch((error) => {
                alert(data.data.data);
            })
        });

    // Extract info from data-bs-* attributes
    var recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an AJAX request here
    // and then do the updating in a callback.
    //
    // Update the modal's content.
    var modalTitle = exampleModal.querySelector('.modal-title')
    var modalBodyInput = exampleModal.querySelector('.modal-body input')

    //modalTitle.textContent = 'New message to ' + recipient
    //modalBodyInput.value = recipient
})


var exampleModal1 = document.getElementById('exampleModal1')
exampleModal1.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    const titleMain = document.getElementById("exampleModalLabel1");
    const name = document.getElementById("productName");
    const price = document.getElementById("productPrice");
    const desc = document.getElementById("description");
    const reserve = document.getElementById("reserverPrice");
    const submitbutton = document.getElementById("createProductButton");
    submitbutton.addEventListener("click", () => {
        if (name.value != "" && price.value != "" && desc.value != "" && reserve.value != "") {
            axios.post('/api/create_new_product', {
                user_id: localStorage.getItem("user_id"),
                name: name.value,
                minimum_bid_price: price.value,
                description: desc.value,
                reserve_price: reserve.value,
                status: false,
            }).then((data) => {
                titleMain.innerText = data.data.message;
            }).catch((error) => {
                console.log(error);
            })
        }
        else {
            alert("Please fill up the form correctly");
        }
    })
})

var exampleModal2 = document.getElementById('exampleModal2')
exampleModal2.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    axios.post('/api/user_like_list', {
        user_id: localStorage.getItem("user_id"),
    }).then((data) => {
        console.log(data)
        const mainBody = document.getElementById("mainBodywish");
        mainBody.innerHTML = "";
        for (let i = 1; i < data.data.product_list.length; i++) {
            mainBody.innerHTML += `
            <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                <div class="text-center">
                    <p class="text-xl text-white font-bold mb-2">${data.data.product_list[0][0]}: ${data.data.product_list[i][0]}</p>
                    <p class="text-base text-gray-400 font-normal">${data.data.product_list[0][1]}: ${data.data.product_list[i][1]}</p>
                    <button type="button" class="btn btn-primary mt-2 removeWishlist" value=${data.data.product_list[i][0]}>Remove</button>
                </div>
            </div>
            `
        }
        const removeWishlistButtons = document.getElementsByClassName("removeWishlist");
        for (let i = 0; i < removeWishlistButtons.length; i++) {
            removeWishlistButtons[i].addEventListener("click", removeProduct, false);
        }
    }).catch((error) => {
        console.log(error);
    })
})


var exampleModal3 = document.getElementById('exampleModal3')
exampleModal3.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    const id = button.getAttribute("value");
    const name = button.getAttribute("name");
    const time = button.getAttribute("time");
    axios.post('/api/auction_data', {
        product_id: id,
    }).then((data) => {
        const mainBody = document.getElementById("mainBodywish2");
        mainBody.innerHTML = "";
        mainBody.innerHTML = `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">Product Name: ${name}</p>
                        <p class="text-xl text-white mb-2">Auction End Time: ${time}</p>
                        <p class="text-xl text-white font-bold mb-2">Users Bidded</p>
                    <div id="names" style="max-height:200px; overflow-y:scroll;">
                </div>
            </div>
        </div>
        `
        const appendName = mainBody.querySelector("#names");
        if (data.data.auctions.length == 0) {
            appendName.innerHTML = `
            <p class="text-base text-gray-400 font-bold">None</p>
            `
        }
        else {
            for (let i = 1; i < data.data.auctions.length; i++) {
                appendName.innerHTML += `
                            <p class="text-base text-gray-400 font-bold">Name: ${data.data.auctions[i][2]}</p>
                            <span>Amount: $${data.data.auctions[i][3]}</span>
            `
            }
        }
    }).catch((error) => {
        console.log(error);
    })
})


var exampleModal2_past_bids = document.getElementById('exampleModal2_past_bids')
exampleModal2_past_bids.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    axios.post('/api/get_past_bids', {
        user_id: localStorage.getItem("user_id"),
    }).then((data) => {
        console.log(data)
        // const mainBody = document.getElementById("mainBodywish2");
        // mainBody.innerHTML = "";
        // mainBody.innerHTML = `
        //         <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center">
        //             <div class="text-center">
        //                 <p class="text-xl text-white font-bold mb-2">Product Name: ${name}</p>
        //                 <p class="text-xl text-white mb-2">Auction End Time: ${time}</p>
        //                 <p class="text-xl text-white font-bold mb-2">Users Bidded</p>
        //             <div id="names" style="max-height:200px; overflow-y:scroll;">
        //         </div>
        //     </div>
        // </div>
        // `
        // const appendName = mainBody.querySelector("#names");
        // if (data.data.auctions.length == 0) {
        //     appendName.innerHTML = `
        //     <p class="text-base text-gray-400 font-bold">None</p>
        //     `
        // }
        // else {
        //     for (let i = 1; i < data.data.auctions.length; i++) {
        //         appendName.innerHTML += `
        //                     <p class="text-base text-gray-400 font-bold">Name: ${data.data.auctions[i][2]}</p>
        //                     <span>Amount: $${data.data.auctions[i][3]}</span>
        //     `
        //     }
        // }
    }).catch((error) => {
        console.log(error);
    })
})


let value = "";

function myFunction(check) {

    let attribute = "";
    try {
        attribute = this.getAttribute("value")
    }
    catch {
        attribute = check;
    }
    const makeButton = document.getElementById("createButton");
    if (attribute == "product_listed_by_seller") {
        makeButton.style.display = "block";
    }
    else {
        makeButton.style.display = "none";
    }
    if (attribute == "bid_regarding_product") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            q: value,
            username: localStorage.getItem("login"),
        }).then((data) => {
            document.getElementById("dropdownMenuButton1").innerText = attribute;
            let tbody = '';
            let tbody2 = "";
            let thead = `
                <table class="table table-dark" style='width:85%; margin:0 auto;'>
                    <thead>
                    <h2 class="text-3xl font-bold text-gray-900">
                    Currently Running Auctions
                </h2>
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">State</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                <tbody>
            `;
            let thead2 = `
                <table class="table table-dark" style='width:85%; margin:0 auto;'>
                    <thead>
                    <h2 class="text-3xl font-bold text-gray-900">
                    Ended Auctions
                </h2>
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">State</th>
                        </tr>
                    </thead>
                <tbody>
            `;
            for (let i = 1; i < data.data.auctions.length; i++) {
                let string = "";
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                if (data.data.auctions[i][4] == false) {
                    string = "Not Sold";
                }
                else {
                    string = "Sold"
                }
                if (data.data.admin == false) {
                    if (string == "Not Sold") {
                        tbody += `
                    <tr>
                        <td>${i}</td>
                        <td>${data.data.auctions[i][3]}</td>
                        <td>$${data.data.auctions[i][1]}</td>
                        <td>${string}</td>
                        <td>
                            <button type="button" class="btn btn-primary bidButton" value=${data.data.auctions[i][2]} data-bs-toggle="modal" data-bs-target="#exampleModal">Bid</button>
                        </td>
                    </tr>`;
                    }
                    else {
                        tbody2 += `
                    <tr>
                        <td>${i}</td>
                        <td>${data.data.auctions[i][3]}</td>
                        <td>$${data.data.auctions[i][1]}</td>
                        <td>${string}</td>
                    </tr>`;
                    }
                }
                else {
                    tbody += `
                    <tr>
                        <td>${i}</td>
                        <td>${data.data.auctions[i][3]}</td>
                        <td>$${data.data.auctions[i][1]}</td>
                        <td>${string}</td>
                    </tr>`;
                }
            }
            document.getElementById('auctionCards').innerHTML += `<div>${thead}${tbody}</tbody></table></div>`;
            document.getElementById('auctionCards').innerHTML += `<div>${thead2}${tbody2}</tbody></table></div>`;
        }).catch((error) => {
            //console.log(error);
        });
    }
    else if (attribute == "offers") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            offered_by: value,
            bid_id: value
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][1]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })
    }
    else if (attribute == "auction_house") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            name: value,
            admin_login: value
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">$${data.data.auctions[i][3]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][4]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })

    }
    else if (attribute == "auction_house_transaction") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            Transaction_By: value,
            commission_taken: value
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[0][7]}: ${data.data.auctions[i][7]}</p>
                        <p class="text-base text-gray-400 font-normal">$${data.data.auctions[i][1]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][4]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })
    }
    else if (attribute == "invokes_tx") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            bid_id: value,
            transaction_status: value
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][1]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][2]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })

    }
    else if (attribute == "product_listed_by_seller") {
        document.getElementById("dropdownMenuButton1").innerText = attribute;
        let tbody = '';
        let thead = `
            <table class="table table-dark" style='width:85%; margin:0 auto;'>
                <thead>
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">Seller</th>
                        <th scope="col">Name</th>
                        <th scope="col">Minimun by price</th>
                        <th scope="col">Sold price</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
            <tbody>
        `;
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            q: value,
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                if (data.data.auctions[i][7] == null) {
                    data.data.auctions[i][7] = 0;
                }

                tbody += `
                    <tr>
                        <td>${i}</td>
                        <td>${data.data.auctions[i][11]}</td>
                        <td>${data.data.auctions[i][2]}</td>
                        <td>$${data.data.auctions[i][3]}</td>
                        <td>$${data.data.auctions[i][7]}</td>
                        <td>
                        <button type="button" class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3" id="showMore" data-bs-toggle="modal" data-bs-target="#exampleModal3" value=${data.data.auctions[i][0]} name="${data.data.auctions[i][2]}" time="${data.data.auctions[i][10]}">Show More</button>
                            <button type="button" class="btn btn-primary mt-2 wishlistButton" value=${data.data.auctions[i][0]}>Add to Wishlist</button>
                        </td>
                    </tr>
                `;
            }
            document.getElementById('auctionCards').innerHTML = `<div>${thead}${tbody}</tbody></table></div>`;
            const wishlistButtons = document.getElementsByClassName("wishlistButton");
            for (let i = 0; i < wishlistButtons.length; i++) {
                wishlistButtons[i].addEventListener("click", wishlist, false);
            }
        }).catch((error) => {
            //console.log(error);
        });

    }
    else if (attribute == "manages_bid") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            manage_by: value,
            bid_id: value,
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][0]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })

    }
    else if (attribute == "app_user") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            name: value,
            balance: value,
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][1]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][5]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })

    }
    else if (attribute == "buyer") {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            name: value,
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][3]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][2]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })

    }
    else if (attribute == "seller") {
        document.getElementById("searchButton").addEventListener("click", (e) => {
            const search = document.getElementById('searchBar');
            const category = document.getElementById("dropdownMenuButton1");
            var check = category.innerText;
            if (check == "Select Category " || search.value == "") {
                window.alert("Please Select a Category and Fill up the search box");
            }
        })
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            name: value,
            active_listings: value,
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][3]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][2]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })
    }
    else if (attribute == "facilitates") {
        document.getElementById("searchButton").addEventListener("click", (e) => {
            const search = document.getElementById('searchBar');
            const category = document.getElementById("dropdownMenuButton1");
            var check = category.innerText;
            if (check == "Select Category " || search.value == "") {
                window.alert("Please Select a Category and Fill up the search box");
            }
        })
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`, {
            name: value,
            house_id: value,
        }).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][0]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })
    }
    else {
        document.getElementById('auctionCards').innerHTML = "";
        axios.post(`/api/${attribute}`).then((data) => {
            for (let i = 1; i < data.data.auctions.length; i++) {
                if (data.data.auctions[i][2] == undefined) {
                    data.data.auctions[i][2] = "Not Available";
                }
                document.getElementById('auctionCards').innerHTML += `
                <div class="w-full bg-gray-900 rounded-lg sahdow-lg p-12 flex flex-col justify-center items-center cards">
                    <div class="text-center">
                        <p class="text-xl text-white font-bold mb-2">${data.data.auctions[i][0]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][2]}</p>
                        <p class="text-base text-gray-400 font-normal">${data.data.auctions[i][3]}</p>
                        <button class="p-2 pl-5 pr-5 transition-colors duration-700 transform bg-indigo-500 hover:bg-blue-400 text-gray-100 text-lg rounded-lg focus:border-4 border-indigo-300 mt-3">Show More</button>
                    </div>
                </div>
                `;
            }
        }).catch((error) => {
            //console.log(error);
        })
    }
}

document.getElementById("searchButton").addEventListener("click", (e) => {
    let search = document.getElementById('searchBar');
    let category = document.getElementById("dropdownMenuButton1");
    var check = category.innerText;
    if (check == "Select Category ") {
        window.alert("Please Select a Category and Fill up the search box");
    }
    else {
        value = search.value;
        myFunction(check)
    }
})

document.getElementById("logoutButton").addEventListener("click", (e) => {
    localStorage.setItem("login", "");
    localStorage.setItem("secret", "");
    window.location.href = "/user.html";
});

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
            axios.post('/api/userData', {
                user_name: localStorage.getItem('login'),
                user_password: localStorage.getItem('secret'),
                user_id: localStorage.getItem("user_id"),
            }).then((userData) => {
                if (userData.data.error) {
                    localStorage.setItem('login', '');
                    localStorage.setItem('secret', '');
                    //window.location.href = '/user.html';
                } else {
                    document.getElementById('userName').innerText = userData.data.name;
                    document.getElementById('userBalance').innerText = `Balance: $${userData.data.balance ? userData.data.balance : 0.00}`;
                    document.getElementById('userName2').innerText = userData.data.name;
                    document.getElementById("adminButton").innerText = `Admin: ${userData.data.admin}`;
                }
            });

            axios.post('api/category', {
                userId: localStorage.getItem("user_id"),
                email: localStorage.getItem("login"),
            }).then((categoryData) => {
                for (var category of categoryData.data.auctions) {
                    document.getElementById("categoryUl").innerHTML +=
                        `<li><a class="dropdown-item" value="${category[0]}">${category[0]}</a></li>`
                }
                const buttons = document.getElementsByClassName("dropdown-item");
                for (var i = 0; i < buttons.length; i++) {
                    buttons[i].addEventListener('click', myFunction, false);
                }
            });
            myFunction('bid_regarding_product');
        }
    });
}

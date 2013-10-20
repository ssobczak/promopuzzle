function PromoPuzzle(serverUrl, userId) {
	var self = this;

	self.ServerUrl = ko.observable(serverUrl);
	self.UserId = ko.observable(userId);

    self.Url = function(url, params) {
    	var result = '' + self.ServerUrl() + '/' + url;

    	if (params) {
    		result +=  '?' + $.param(params);
    	}

    	return result;
    };

    self.TotalPuzzles = ko.observable(0);

	self.ShowPuzzles = function() {
		$.ajax({
		    type: "GET",
		    url: self.Url('api/images.json', {user_id: self.UserId()})
		}).done(function(data) {
			var temp = [];
			var totalPuzzles = 0;

			for(var i=0; i<data.length; ++i){
				totalPuzzles += data[i].parts.length;
				var model = ko.viewmodel.fromModel(data[i], self.ImagesMappingOptions);
				model.PartClickedEvent = function(parts) {
					console.log(parts[0].id());
				}
				temp.push(model);
			}

			self.TotalPuzzles(totalPuzzles);
			self.Puzzles(temp);

			self.ToStage('images');
		});
	};


	self.Puzzles = ko.observableArray();

	self.ToStage = function(name, model) {
		debugger;
		var stageHtml = $('.purgatory').find('.' + name).html();
		$('.app').html(stageHtml);
		if (!model) {
			model = self;
		}
		ko.cleanNode($('.app')[0]);
		ko.applyBindings(self, $('.app')[0]);
	};


	self.BrandLogoClicked = function() {
		self.ShowPuzzles();
	};

	self.ImagesMappingOptions = { 
	    extend: {
	        "{root}": function(image){
	            
	            image.PartClickedEvent = undefined;
	        	image.MappedParts = ko.observableArray();


	        	for(var i=0; i<9; ++i) {
	        		var mappedPart = {};
	        		mappedPart.position = i;
	        		debugger;
	        		mappedPart.parts = image.parts().filter(function(p) { return p.position() == i; });
	        		mappedPart.amount = mappedPart.parts.length;
	        		mappedPart.visible = mappedPart.amount > 0;
	        		mappedPart.imageSource = 'img/' + ( mappedPart.amount ? ( 'kot' + mappedPart.parts[0].image_id().toString()  +mappedPart.position.toString() +'.gif' ) : 'empty.gif' );
	        		mappedPart.click = function () {
	        			if (this.amount == 0) { return; }
	        			
	        			if (image.PartClickedEvent) {
	        				image.PartClickedEvent(this.parts);
	        			}
	        		};

	        		image.MappedParts.push(mappedPart);
	        	}

	        	image.MappedPartsRows = ko.observableArray();

	        	image.MappedPartsRows.push(image.MappedParts().slice(0,3));
	        	image.MappedPartsRows.push(image.MappedParts().slice(3,6));
	        	image.MappedPartsRows.push(image.MappedParts().slice(6,9));


	        }
	    }
	};

};


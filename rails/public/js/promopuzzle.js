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
				temp.push(ko.viewmodel.fromModel(data[i], self.ImagesMappingOptions));
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
	            debugger;
	        }
	    }
	};

};



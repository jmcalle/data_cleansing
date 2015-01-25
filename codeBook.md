The flowstream is comprised of the following functions:

	1. processData: main function that triggers the flow receives the following variables inputpath (where the original raw files 
			are located) and output_filename where the final table will be written into.

		2. calls tidyData: in charge of aggregating the measures by grouping the subject and activities as well performing
				   the average for each measure
		
			3. calls mergeData: by passing the inputpath to read and merge the test and train sets. It also enriches the
					    data with the subject and activity information. Once the both data sets are enriched the 
					    appended table containing both is returned.
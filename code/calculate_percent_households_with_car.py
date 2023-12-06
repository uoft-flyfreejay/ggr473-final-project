import csv

with open('T:\Hard drive random\ggr473\ggr473-final-project\code\cleaned_census.csv', 'r') as infile, open('sabih_cleaned_census.csv', 'w', newline='') as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)
    
    # Write the header row with new column name
    header = next(reader) 
    header.append('percent_households_with_car')
    writer.writerow(header)
    
    # Process data rows
    for row in reader:
        novehicle = int(row[1]) 
        onevehicle = int(row[2])
        twovehicle = int(row[3]) 
        threevehicle = int(row[4])
        percent = ((onevehicle + twovehicle + threevehicle) / (novehicle + onevehicle + twovehicle + threevehicle)) * 100
        row.append(round(percent))
        
        writer.writerow(row)
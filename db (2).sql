	DROP DATABASE IF EXISTS RPMS;
	create database RPMS;
		use RPMS;
		CREATE TABLE tbl_personnel (
	    fld_personnel_id int NOT NULL AUTO_INCREMENT,
	    fld_lname varchar(255) NOT NULL,
	    fld_fname varchar(255),
	    fld_mname varchar(255),
	    fld_email varchar(255),
	    fld_contact_no varchar(255),
	     fld_active int DEFAULT 1,
	     fld_dob varchar(50),
	     fld_address text,
	     fld_btype varchar(3),
	     fld_tin varchar(20),
	     fld_gsis varchar(50),
	     fld_philhealth varchar(50),
	     fld_pagibig varchar(50),
	     fld_status varchar(50),
	     fld_code int,
	    PRIMARY KEY (fld_personnel_id)
		);


		create table tbl_ass(
			ass_id int not null auto_increment,
			fld_personnel_id int not null,
			fld_area_no int not null DEFAULT 0,
			fld_shifts_id int not null DEFAULT 1,
			fld_day_offs_id int not null DEFAULT 1,
			PRIMARY key (ass_id)
			);
		

		CREATE table tbl_accounts(
			fld_account_id int not null AUTO_INCREMENT,
			fld_personnel_id int not null,
			fld_email varchar(255) not null,

			fld_pw varchar(255) not null,
			fld_privilege varchar(255) not null DEFAULT 'Non-Admin',
			PRIMARY key (fld_account_id)
			);

		create table tbl_shifts(
			fld_shifts_id int not null auto_increment,
			fld_shift varchar(255) not null,
			PRIMARY key(fld_shifts_id)
			);
		create table tbl_dayoffs(
			fld_day_offs_id int not null AUTO_INCREMENT,
			fld_day_offs varchar(255) not null,
			PRIMARY key	(fld_day_offs_id)
			);
		create table tbl_location(
			fld_area_no int not null auto_increment,
			fld_address varchar(299),
			fld_lbl text,
			fld_lat text,
			fld_lng text,
			fld_desc text,
			PRIMARY key	(fld_area_no)
			);
			create table tbl_event_logs(
			fld_event_logs int not null auto_increment,
			fld_event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			fld_desc text,
			PRIMARY key	(fld_event_logs)
			);

		insert into tbl_personnel(fld_lname, fld_fname, fld_mname, fld_email, fld_contact_no)values(
			'admin_lname', 'admin_fname', 'admin_mname','admin@gmail.com', '909023942');
		insert into tbl_accounts(fld_personnel_id, fld_email, fld_pw, fld_privilege)values(
			1, 'admin@gmail.com', 'admin', 'Admin');
		insert into tbl_ass(fld_personnel_id)values(
			1);
		insert into tbl_location(fld_address,fld_lbl,fld_lat, fld_lng, fld_desc)
			values('CDO', 'A1', 8.477217, 124.645920, "For initiating map use only");
		Insert into tbl_shifts(fld_shift)
				values('Time in: 06:00 AM Time out: 2:00 PM');
		Insert into tbl_shifts(fld_shift)
				values('Time in: 02:00 PM Time out: 10:00 PM');
		Insert into tbl_dayoffs(fld_day_offs)
				values('Sun');


-- THIS IS THE PROCEDURE

DELIMITER $$

drop PROCEDURE if exists ROTATION;
CREATE  PROCEDURE ROTATION()

BLOCK1:BEGIN
 	DECLARE person_id, old_shift_id,new_shift_id, new_area, shifts,count,x int; 
	DECLARE done INT DEFAULT FALSE;
	DECLARE tbl_ass_personnel_id CURSOR FOR SELECT fld_personnel_id, tbl_ass.fld_shifts_id 
			FROM tbl_ass INNER JOIN tbl_location ON tbl_ass.fld_area_no	= tbl_location.fld_area_no	
					WHERE tbl_location.fld_lbl like 'A%' 
							OR tbl_location.fld_lbl LIKE 'B%' 
							OR tbl_location.fld_lbl LIKE 'C%' 
									order by tbl_ass.fld_area_no asc;
									
	DECLARE tbl_ass_area_no CURSOR FOR SELECT tbl_ass.fld_area_no FROM tbl_ass
			INNER JOIN tbl_location ON tbl_ass.fld_area_no	= tbl_location.fld_area_no	
							WHERE tbl_location.fld_lbl like 'A%' 
									OR tbl_location.fld_lbl LIKE 'B%' 
									OR tbl_location.fld_lbl LIKE 'C%' 
											order by  rand();
	
	
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  OPEN tbl_ass_personnel_id;
  OPEN tbl_ass_area_no;
  
  area_loop: LOOP
    FETCH tbl_ass_personnel_id INTO person_id, old_shift_id;
    FETCH tbl_ass_area_no INTO new_area;
    SELECT COUNT(*) FROM tbl_shifts INTO count;
    
    
    IF done THEN
      LEAVE area_loop;
    END IF;
    	insert into tbl_event_logs(fld_desc)values(concat('new_shift_id=', old_shift_id,' new area=',new_area));
		    		
    	BLOCK2: begin
    	
	    	DECLARE no_more_rows boolean DEFAULT  FALSE;
	    	DECLARE shifts_ids CURSOR FOR SELECT fld_shifts_id FROM tbl_shifts;
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;
	    	OPEN shifts_ids;
	    	shifts_loop: LOOP 
	    	FETCH shifts_ids INTO new_shift_id;
		    	IF no_more_rows THEN
			      LEAVE shifts_loop;
			    END IF;
			    	UPDATE tbl_ass set fld_area_no = new_area 
		    			WHERE fld_personnel_id=person_id;
		    		IF old_shift_id!=new_shift_id THEN
		    		UPDATE tbl_ass set  fld_shifts_id=new_shift_id
		    			WHERE fld_personnel_id=person_id;
		    		END IF;
		    		insert into tbl_event_logs(fld_desc)values(concat('new_shift_id=', new_shift_id,' new area=',new_area));
		    		
			    
			END LOOP shifts_loop;
			CLOSE shifts_ids;
		END BLOCK2;
  END LOOP area_loop;
  CLOSE tbl_ass_personnel_id;
  CLOSE tbl_ass_area_no;
    
END BLOCK1;
$$
DELIMITER ;


-- THIS IS THE EVENT

DELIMITER $$
DROP EVENT IF EXISTS RPMS_ROTATION;

CREATE EVENT RPMS_ROTATION
ON SCHEDULE
    EVERY 1 MINUTE
    STARTS '2021-12-01 22:00:00'
    ON COMPLETION PRESERVE
DO

BEGIN
	
	IF DAY(NOW()) = DAY(LAST_DAY(NOW())) OR DAY(NOW())=15 THEN
		IF HOUR(NOW()) = 22 THEN
			IF MINUTE(NOW()) = 1 THEN
				CALL ROTATION();
			END IF;
		END IF;
	END IF;
END $$
DELIMITER ;







		
			
#-------------------------------------------------------------------------------
# Program version Allplan Bridge 2023-0-0
# Database version 1.04
#-------------------------------------------------------------------------------

ABM BEGIN
	
	#---------------------------------------------------------------------------
	# General project settings
	#---------------------------------------------------------------------------
	
	PROJECT BEGIN
		
		PTEXT      "Example of a inclined pre-stressed concrete bridge"
		PTEXT      "2 slabs concrete bridge"
		
		IFC        OBJTYPE          "IfcBridge:FRAMEWORK"
		
		UNIT       SETDB ANGLED     "\[deg\]"    ""      "Degree to Radians"
		UNIT       SETDB ANGLE      "\[rad\]"    ""      "Radians"
		UNIT       SETDB LCROSSD    "\[m\]"      ""      "Meter"
		UNIT       SETDB LCROSS     "\[m\]"      ""      "Meter"
		UNIT       SETDB LSTRUCTD   "\[m\]"      ""      "Meter"
		UNIT       SETDB LSTRUCT    "\[m\]"      ""      "Meter"
		UNIT       SETDB STATION    "\[m\]"      ""      "Meter"
		UNIT       SETDB TEMP       "\[°C\]"     ""      "Celsius for temperature "
		UNIT       SETDB AREINF     "\[cm²\]"    ""      "Square Centimeter to Square Meter"
		UNIT       SETDB ASTRAND    "\[mm²\]"    ""      "Square Millimeter to Square Meter"
		UNIT       SETDB EMOD       "\[N/mm²\]"  ""      "Stress to Kilonewton per Square Meter"
		UNIT       SETDB STRESS     "\[N/mm²\]"  ""      "Stress to Kilonewton per Square Meter"
		UNIT       SETDB FORCE      "\[kN\]"     ""      "Kilonewton"
		UNIT       SETDB MOMENT     "\[kNm\]"    ""      "Kilonewton Meter"
		UNIT       SETDB DEVIATION  "\[rad/m\]"  ""      "Radian per Meter"
		UNIT       SETDB LSMALL     "\[mm\]"     ""      "Millimeter to Meter"
		UNIT       SETDB GAMMA      "\[kN/m³\]"  ""      "Specific weight Kilonewton per Meter³"
		UNIT       SETDB ACC        "\[m/s²\]"   ""      "Acceleration Meter per Second²"
		
		PORIGIN                 0.000                0.000
		RADIUS+    LEFT
		
		STANDARD   "EN"
		
		#-----------------------------------------------------------------------
		# Recalculation settings (analysis)
		#-----------------------------------------------------------------------
		
		RECALCULATION BEGIN
			
			OPTION   TIMELINE                 ON
			
			STRUCTURE BEGIN
				
				ANALYSISMODEL                 ON
				OPTION   AUTOENUM             ON
				
			STRUCTURE END
			
		RECALCULATION END
		
	PROJECT END
	
	#---------------------------------------------------------------------------
	# Standard EC2
	#---------------------------------------------------------------------------
	
	STANDARD "EN" BEGIN
		
		MATERIALS "@concrete" BEGIN
			
			MATERIAL "C35/45" BEGIN
				
				TEXT        ""
				FOREIGN     "EN_Eurocode:C_35/45"
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            34100                    "\%0.0lf" ""
					VALUE   GMODUL    "G"            14208.3                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.2                      "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        24.5166                  "\%0.1lf" ""
					VALUE   FCK       "fck"          35                       "\%0.0lf" ""
					VALUE   FCM       "fcm"          43                       "\%0.0lf" ""
					VALUE   CEMENTCLASS "Cement class" 1                      "\%0.3lf" ""
					VALUE   CAGGREGATE "Concrete Aggregate" QUARTZITE         ""        ""
					VALUE   GCEMENT   "Cement Content" 0                      "\%0.1lf" ""
					VALUE   GSILICATE "Silicate Content" 0                    "\%0.1lf" ""
					
				VALUES END
				
			MATERIAL END
			
			MATERIAL "C40/50" BEGIN
				
				TEXT        ""
				FOREIGN     "EN_Eurocode:C_40/50"
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            35200                    "\%0.0lf" ""
					VALUE   GMODUL    "G"            14666.7                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.2                      "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        24.5166                  "\%0.1lf" ""
					VALUE   FCK       "fck"          40                       "\%0.0lf" ""
					VALUE   FCM       "fcm"          48                       "\%0.0lf" ""
					VALUE   CEMENTCLASS "Cement class" 1                      "\%0.3lf" ""
					VALUE   CAGGREGATE "Concrete Aggregate" QUARTZITE         ""        ""
					VALUE   GCEMENT   "Cement Content" 0                      "\%0.1lf" ""
					VALUE   GSILICATE "Silicate Content" 0                    "\%0.1lf" ""
					
				VALUES END
				
			MATERIAL END
			
		MATERIALS END
		
		MATERIALS "@prestress_steel" BEGIN
			
			MATERIAL "Y1860S7-15,2" BEGIN
				
				TEXT        ""
				FOREIGN     ""
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            195000                   "\%0.0lf" ""
					VALUE   GMODUL    "G"            84782.6                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.15                     "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        76.9822                  "\%0.1lf" ""
					VALUE   FPK       "fpk"          1860                     "\%0.0lf" ""
					VALUE   FP01K     "fp01k"        1640                     "\%0.0lf" ""
					VALUE   EPS_UD    "eps_ud"       0.028                    "\%0.3lf" ""
					VALUE   EPS_UK    "eps_uk"       0.035                    "\%0.3lf" ""
					VALUE   SIGPMAX   "Sig-pm0"      1394                     "\%0.0lf" ""
					VALUE   RELAXCLASS "Relaxation class" 2                   "\%d"     ""
					
				VALUES END
				
			MATERIAL END
			
		MATERIALS END
		
		MATERIALS "@reinf_steel" BEGIN
			
			MATERIAL "B 500B" BEGIN
				
				TEXT        ""
				FOREIGN     "EN_Eurocode:St500(B)"
				
				VALUES BEGIN
					
					VALUE   EMODUL    "E"            200000                   "\%0.0lf" ""
					VALUE   GMODUL    "G"            83333.3                  "\%0.0lf" ""
					VALUE   POISSON   "Ny"           0.2                      "\%0.1lf" ""
					VALUE   ALPHAT    "Alpha-T"      1E-05                    "\%0.6lf" ""
					VALUE   GAMMA     "Gamma"        76.9822                  "\%0.1lf" ""
					VALUE   FYK       "fyk"          500                      "\%0.0lf" ""
					VALUE   REINFCLASS "Reinforcement Class" CLASSB           ""        ""
					
				VALUES END
				
			MATERIAL END
			
		MATERIALS END
		
	STANDARD END
	
	#---------------------------------------------------------------------------
	# Axes definition
	#---------------------------------------------------------------------------
	
	AXES BEGIN
		
		AXIS "Axis" BEGIN
			
			BIMPLUS         "" ""
			
			SSLOPE          ASC
			SBEGIN                           0
			
			PLAN BEGIN
				
				POINT       ABS                   0               0               0
				CIRCLE      DSR                  70             300
				SPIRAL      KKL          0.00333333     -0.00566667              70
				CIRCLE      DSR                  80            -200
				
			PLAN END
			
			PROFILES BEGIN
				
				PROFILE "Profile" ACTIVE BEGIN
					
					SCALE       10
					
					POLYGON BEGIN
						
						POINT            0.000000     0.000000
						POINT          110.000000     0.500000   PARARAD   -6000.000000
						POINT          220.000000    -0.300000
						
					POLYGON END
					
				PROFILE END
				
			PROFILES END
			
		AXIS END
		
	AXES END
	
	#---------------------------------------------------------------------------
	# Calculator - Formulas, Functions, Tables 
	#---------------------------------------------------------------------------
	
	CALC BEGIN
		
		TABLE      "hsection"        "Section height"
		TABLE      "bthickness"      "Bottom thickness"
		TABLE      "webwidth"        "Web width"
		TABLE      "incl"            "Section incl"
		TABLE      "inclLeft"        ""
		TABLE      "inclRight"       ""
		
		CURVE "hsection"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "3.5"
			PARA0B          "24"    "3.5"
			LINE            "43.5"  "5.5"
			PARA0E          "46.5"  "5.5"
			LINE            "66"    "3.5"
			PARA0B          "88"    "3.5"
			LINE            "108.5" "5.5"
			PARA0E          "111.5" "5.5"
			LINE            "131"   "3.5"
			PARA0B          "154"   "3.5"
			LINE            "173.5" "5.5"
			PARA0E          "176.5" "5.5"
			LINE            "196"   "3.5"
			LINE            "220"   "3.5"
			
		CURVE END
		
		CURVE "bthickness"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "0.3"
			LINE            "24"    "0.3"
			LINE            "43.5"  "0.35"
			LINE            "46.5"  "0.35"
			LINE            "66"    "0.3"
			LINE            "89"    "0.3"
			LINE            "108.5" "0.35"
			LINE            "111.5" "0.35"
			LINE            "131"   "0.3"
			LINE            "154"   "0.3"
			LINE            "173.5" "0.35"
			LINE            "176.5" "0.35"
			LINE            "196"   "0.3"
			LINE            "220"   "0.3"
			
		CURVE END
		
		CURVE "webwidth"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "0.6"
			LINE            "24"    "0.6"
			LINE            "43.5"  "0.7"
			LINE            "46.5"  "0.7"
			LINE            "66"    "0.6"
			LINE            "89"    "0.6"
			LINE            "108.5" "0.7"
			LINE            "111.5" "0.7"
			LINE            "131"   "0.6"
			LINE            "154"   "0.6"
			LINE            "173.5" "0.7"
			LINE            "176.5" "0.7"
			LINE            "196"   "0.6"
			LINE            "220"   "0.6"
			
		CURVE END
		
		CURVE "incl"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "4.57"
			LINE            "70"    "4.57"
			LINE            "105"   "0"
			LINE            "140"   "-4.57"
			LINE            "220"   "-4.57"
			
		CURVE END
		
		CURVE "inclLeft"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "-1.43"
			LINE            "70"    "-1.43"
			LINE            "105"   "-1.43"
			LINE            "140"   "-4.57"
			LINE            "220"   "-4.57"
			
		CURVE END
		
		CURVE "inclRight"   CONSTX   CONSTY BEGIN
			
			LINE            "0"     "4.57"
			LINE            "70"    "4.57"
			LINE            "105"   "1.43"
			LINE            "140"   "1.43"
			LINE            "220"   "1.43"
			
		CURVE END
		
	CALC END
	
	#---------------------------------------------------------------------------
	# Cross sections
	#---------------------------------------------------------------------------
	
	CSECTIONS BEGIN
		
		CSECTION "Pier" BEGIN
			
			TEXT   "Pier cross section"
			
			CVARS BEGIN
				
				VAR         "wpier"                    1.50000  LENGTH  "Pier width"
				VAR         "hpier"                   -1.50000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARALLEL    "L1"           "hpier"        NEG  LINE   "Zloc"
				PARALLEL    "L2"           "hpier"        POS  LINE   "Zloc"
				PARALLEL    "L3"           "wpier"        POS  LINE   "Yloc"
				PARALLEL    "L4"           "wpier"        NEG  LINE   "Yloc"
				PCART       "P1"                0.00000     -0.05000   LSECT  "L1"   "L3"
				PCART       "P2"                0.00000      0.05000   LSECT  "L2"   "L3"
				PCART       "P3"                0.00000      0.05000   LSECT  "L2"   "L4"
				PCART       "P4"                0.00000     -0.05000   LSECT  "L1"   "L4"
				PCART       "P5"               -0.90000      0.00000   LSECT  "L3"   "Zloc"
				PCART       "P6"                0.90000      0.00000   LSECT  "L4"   "Zloc"
				PCART       "P7"                0.00000     -0.05000   LSECT  "L1"   "Yloc"
				PCART       "P8"                0.00000      0.05000   LSECT  "L2"   "Yloc"
				PCART       "P9"               -1.00000      0.00000   LSECT  "L3"   "Zloc"
				PCART       "P11"               1.00000      0.00000   LSECT  "L4"   "Zloc"
				PARALLEL    "L5"           "hpier"        NEG  LINE   "L3"
				PARALLEL    "L6"           "hpier"        POS  LINE   "L4"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Boundary" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L1"    "L3"    RADNEXT   "hpier"
						BPOINT       2  LSECT   "L2"    "L3"
						BPOINT       3  LSECT   "L2"    "L4"    RADNEXT   "hpier"
						BPOINT       4  LSECT   "L1"    "L4"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary1" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P1"            RADNEXT     -1.45000
						BPOINT       2  POINT   "P2"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary2" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P3"            RADNEXT     -1.45000
						BPOINT       2  POINT   "P4"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary3" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P1"
						BPOINT       2  POINT   "P4"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary4" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P2"
						BPOINT       2  POINT   "P3"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary6" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P7"
						BPOINT       2  POINT   "P8"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary7" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P5"
						BPOINT       2  POINT   "P6"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary5" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L1"    "L5"
						BPOINT       2  LSECT   "L1"    "L6"
						BPOINT       3  LSECT   "L2"    "L6"
						BPOINT       4  LSECT   "L2"    "L5"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary8" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L1"    "L4"
						BPOINT       2  LSECT   "L2"    "L4"
						BPOINT       3  LSECT   "L2"    "L3"
						BPOINT       4  LSECT   "L3"    "L1"
						
					POINTS END
					
				BOUNDARY END
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "Zloc"    "Yloc"
				
				SBEAM       1    BOUNDARY  "Boundary"
				
			CUNITS END
			
			CPROPSETS 1 BEGIN
				
				PROPERTY    IFC            OBJTYPE        "IfcColumn:PIERSTEM"
				PROPERTY    IFC            OBJNAME        "Pier"
				
				REINFLONG "Long_Bott" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary4"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFLONG "Long_Left" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary1"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFLONG "Long_Right" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary2"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFLONG "Long_Top" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary3"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFSHEARL "Shear_Long_y" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary5"
					
				REINFSHEARL END
				
				REINFSHEARL "Shear_Long_z" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary8"
					
				REINFSHEARL END
				
				REINFSHEARW "Shear_y" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary6"
					
				REINFSHEARW END
				
				REINFSHEARW "Shear_z" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary7"
					
				REINFSHEARW END
				
				STRESSRESULTS "Stress-Check" BEGIN
					
					POINT   "SP1"                    LSECT   "L1"        "Yloc"
					POINT   "SP2"                    LSECT   "L2"        "Yloc"
					POINT   "SP3"                    POINT   "P9"
					POINT   "SP4"                    POINT   "P11"
					
				STRESSRESULTS END
				
				TEMPERATURE "Temperature" BEGIN
					
					POINT   "TP1"         0.000      LSECT   "L1"        "Yloc"
					POINT   "TP2"         0.000      LSECT   "L2"        "Yloc"
					POINT   "TP3"         0.000      POINT   "P9"
					POINT   "TP4"         0.000      POINT   "P11"
					
				TEMPERATURE END
				
				REINFTORSION "Torsion" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     ""   AUTO
					COVER           0.050
					
				REINFTORSION END
				
			CPROPSETS END
			
			CGREF BEGIN
				
				POINT       "RP-P"    LSECT     "Zloc"    "Yloc"
				
			CGREF END
			
		CSECTION END
		
		CSECTION "MG" BEGIN
			
			TEXT   ""
			
			CVARS BEGIN
				
				VAR         "hsection"                 3.10000  LENGTH  "Height of MG"
				VAR         "webwidth"                 0.55000  LENGTH  "Web thickness of MG"
				VAR         "bthickness"               0.40000  LENGTH  "Bottom slab thickness of MG"
				VAR         "incl"                    -1.79841  ANGLE   "main slope"
				VAR         "inclLeft"               175.76259  ANGLE   "left slope"
				VAR         "inclRight"                1.40000  ANGLE   "right slope"
				VAR         "webwidth_half"            0.27500  LENGTH  ""
				VAR         "bthickness_half"          0.15000  LENGTH  ""
				
			CVARS END
			
			CLINES BEGIN
				
				ZAXIS       "Zloc"              0.00000      0.00000
				YAXIS       "Yloc"              0.00000     90.00000
				
				PARALLEL    "L21"               5.75000   POS  LINE   "Yloc"
				PARALLEL    "L1"                3.00000   POS  LINE   "L21"
				PARALLEL    "L2"                3.00000   NEG  LINE   "L21"
				ABSANGLE    "L3"           "incl"              LSECT  "L21"  "Zloc"
				PARALLEL    "L4"                0.30000   NEG  LINE   "L3"
				PARALLEL    "L5"                0.50000   NEG  LINE   "L3"
				PARALLEL    "L6"                0.75000   POS  LINE   "L1"
				PARALLEL    "L7"                0.75000   NEG  LINE   "L2"
				PARALLEL    "L8"                2.25000   POS  LINE   "L1"
				PARALLEL    "L9"                2.25000   NEG  LINE   "L2"
				ABSANGLE    "L11"          "inclLeft"          LSECT  "L6"   "L3"
				PARALLEL    "L14"          "webwidth"     NEG  LINE   "L1"
				PARALLEL    "L15"          "webwidth"     POS  LINE   "L2"
				PARALLEL    "L16"          "hsection"     NEG  LINE   "Zloc"
				PARALLEL    "L17"          "bthickness"   POS  LINE   "L16"
				PARALLEL    "L18"               0.40000   NEG  LINE   "L14"
				PARALLEL    "L19"               0.40000   POS  LINE   "L17"
				PARALLEL    "L20"               0.40000   POS  LINE   "L15"
				PARALLEL    "L23"               1.00000   NEG  LINE   "L21"
				PARALLEL    "L24"               1.00000   POS  LINE   "L21"
				PCART       "P1"                0.00000     -0.20000   LSECT  "L8"   "L11"
				ABSANGLE    "L10"          "inclRight"         LSECT  "L7"   "L3"
				PCART       "P2"                0.00000     -0.20000   LSECT  "L9"   "L10"
				ABSANGLE    "L12"               0.00000        LSECT  "L1"   "L5"
				ABSANGLE    "L13"               0.00000        LSECT  "L2"   "L5"
				PARALLEL    "L22"               5.75000   NEG  LINE   "Yloc"
				PARALLEL    "L25"               1.00000   POS  LINE   "L22"
				PARALLEL    "L26"               1.00000   NEG  LINE   "L22"
				PARALLEL    "L27"               3.00000   POS  LINE   "L22"
				PARALLEL    "L28"               3.00000   NEG  LINE   "L22"
				PARALLEL    "L30"               0.75000   NEG  LINE   "L28"
				PARALLEL    "L29"               0.75000   POS  LINE   "L27"
				PARALLEL    "L31"               2.25000   POS  LINE   "L27"
				PARALLEL    "L32"               2.25000   NEG  LINE   "L28"
				ABSANGLE    "L33"          "incl"              LSECT  "L22"  "Zloc"
				ABSANGLE    "L34"          "inclLeft"          LSECT  "L29"  "L33"
				ABSANGLE    "L35"          "inclRight"         LSECT  "L30"  "L33"
				PCART       "P3"                0.00000     -0.20000   LSECT  "L31"  "L34"
				PCART       "P4"                0.00000     -0.20000   LSECT  "L32"  "L35"
				PARALLEL    "L36"               0.50000   NEG  LINE   "L33"
				PARALLEL    "L37"          "webwidth"     NEG  LINE   "L27"
				PARALLEL    "L38"          "webwidth"     POS  LINE   "L28"
				PARALLEL    "L39"               0.40000   NEG  LINE   "L37"
				PARALLEL    "L40"               0.40000   POS  LINE   "L38"
				PARALLEL    "L42"               0.30000   NEG  LINE   "L33"
				PARALLEL    "L41"          "webwidth_half" NEG LINE   "L1"
				PARALLEL    "L43"          "webwidth_half" POS LINE   "L2"
				PARALLEL    "L44"          "webwidth_half" NEG LINE   "L27"
				PARALLEL    "L45"          "webwidth_half" POS LINE   "L28"
				PCART       "P5"                0.05000     -0.10000   LSECT  "L8"   "L11"
				PCART       "P6"                0.00000     -0.10000   LSECT  "L6"   "L11"
				PCART       "P7"                0.00000     -0.10000   LSECT  "L7"   "L10"
				PCART       "P8"               -0.05000     -0.10000   LSECT  "L9"   "L10"
				PCART       "P9"                0.00000 "bthickness_half"  LSECT  "L16"  "L41"
				PCART       "P10"               0.00000 "bthickness_half"  LSECT  "L16"  "L43"
				PCART       "P11"               0.05000     -0.10000   LSECT  "L31"  "L34"
				PCART       "P12"               0.00000     -0.10000   LSECT  "L29"  "L34"
				PCART       "P13"               0.00000     -0.10000   LSECT  "L30"  "L35"
				PCART       "P14"              -0.05000     -0.10000   LSECT  "L32"  "L35"
				PCART       "P15"               0.00000 "bthickness_half"  LSECT  "L16"  "L44"
				PCART       "P16"               0.00000 "bthickness_half"  LSECT  "L16"  "L45"
				
			CLINES END
			
			CBOUNDARIES BEGIN
				
				BOUNDARY "Boundary1" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L15"   "L13"
						BPOINT       2  LSECT   "L4"    "L23"
						BPOINT       3  LSECT   "L4"    "L24"
						BPOINT       4  LSECT   "L14"   "L12"
						BPOINT       5  LSECT   "L14"   "L19"
						BPOINT       6  LSECT   "L17"   "L18"
						BPOINT       7  LSECT   "L17"   "L20"
						BPOINT       8  LSECT   "L15"   "L19"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary2" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L6"    "L11"
						BPOINT       2  LSECT   "L8"    "L11"
						BPOINT       3  POINT   "P1"
						BPOINT       4  LSECT   "L1"    "L5"
						BPOINT       5  LSECT   "L1"    "L16"
						BPOINT       6  LSECT   "L2"    "L16"
						BPOINT       7  LSECT   "L2"    "L5"
						BPOINT       8  POINT   "P2"
						BPOINT       9  LSECT   "L9"    "L10"
						BPOINT      10  LSECT   "L7"    "L3"
						BPOINT      11  LSECT   "L2"    "L3"
						BPOINT      12  LSECT   "L15"   "L3"
						BPOINT      13  LSECT   "L14"   "L3"
						BPOINT      14  LSECT   "L1"    "L3"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary3" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L29"   "L34"
						BPOINT       2  LSECT   "L31"   "L34"
						BPOINT       3  POINT   "P3"
						BPOINT       4  LSECT   "L27"   "L36"
						BPOINT       5  LSECT   "L16"   "L27"
						BPOINT       6  LSECT   "L16"   "L28"
						BPOINT       7  LSECT   "L28"   "L36"
						BPOINT       8  POINT   "P4"
						BPOINT       9  LSECT   "L32"   "L35"
						BPOINT      10  LSECT   "L30"   "L35"
						BPOINT      11  LSECT   "L28"   "L33"
						BPOINT      12  LSECT   "L38"   "L33"
						BPOINT      13  LSECT   "L37"   "L33"
						BPOINT      14  LSECT   "L27"   "L33"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary4" BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L38"   "L13"
						BPOINT       2  LSECT   "L26"   "L42"
						BPOINT       3  LSECT   "L25"   "L42"
						BPOINT       4  LSECT   "L37"   "L12"
						BPOINT       5  LSECT   "L19"   "L37"
						BPOINT       6  LSECT   "L17"   "L39"
						BPOINT       7  LSECT   "L17"   "L40"
						BPOINT       8  LSECT   "L19"   "L38"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary9" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P5"
						BPOINT       2  POINT   "P6"
						BPOINT       3  POINT   "P7"
						BPOINT       4  POINT   "P8"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary5" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P9"
						BPOINT       2  POINT   "P10"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary6" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L41"   "L12"
						BPOINT       2  LSECT   "L17"   "L41"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary7" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L17"   "L43"
						BPOINT       2  LSECT   "L43"   "L13"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary8" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L1"    "L12"
						BPOINT       2  LSECT   "L2"    "L13"
						BPOINT       3  LSECT   "L2"    "L17"
						BPOINT       4  LSECT   "L1"    "L17"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary10" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P15"
						BPOINT       2  POINT   "P16"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary11" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  POINT   "P11"
						BPOINT       2  POINT   "P12"
						BPOINT       3  POINT   "P13"
						BPOINT       4  POINT   "P14"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary12" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L27"   "L12"
						BPOINT       2  LSECT   "L28"   "L13"
						BPOINT       3  LSECT   "L17"   "L28"
						BPOINT       4  LSECT   "L17"   "L27"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary13" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L44"   "L12"
						BPOINT       2  LSECT   "L17"   "L44"
						
					POINTS END
					
				BOUNDARY END
				
				BOUNDARY "Boundary14" OPEN BEGIN
					
					POINTS BEGIN
						
						BPOINT       1  LSECT   "L17"   "L45"
						BPOINT       2  LSECT   "L45"   "L13"
						
					POINTS END
					
				BOUNDARY END
				
				COMBINE     "Boundary2"     MINUS     "Boundary1"
				
				COMBINE     "Boundary3"     MINUS     "Boundary4"
				
			CBOUNDARIES END
			
			CUNITS BEGIN
				
				SBEAM       1    LSECT     "L21"     "Zloc"
				SBEAM       2    LSECT     "L22"     "Zloc"
				
				SBEAM       1    BOUNDARY  "Boundary2"
				SBEAM       2    BOUNDARY  "Boundary3"
				
			CUNITS END
			
			CPROPSETS 1 BEGIN
				
				PROPERTY    IFC            OBJTYPE        "IfcBeam:BEAM"
				PROPERTY    IFC            OBJNAME        "Beam 01"
				
				REINFLONG "1_Long-Bott" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary5"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFLONG "1_Long-Top" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary9"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFSHEARL "1_Shear-Long" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary8"
					
				REINFSHEARL END
				
				REINFSHEARW "1_Shear_WebL" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary6"
					
				REINFSHEARW END
				
				REINFSHEARW "1_Shear_WebR" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary7"
					
				REINFSHEARW END
				
				STRESSRESULTS "1_Stress-Check" BEGIN
					
					POINT   "SP1"                    LSECT   "L21"       "Zloc"
					POINT   "SP2"                    LSECT   "L21"       "L16"
					
				STRESSRESULTS END
				
				TEMPERATURE "1_Temperature" BEGIN
					
					POINT   "TP1"         0.000      LSECT   "L21"       "Zloc"
					POINT   "TP2"         0.000      LSECT   "L21"       "L4"
					POINT   "TP3"         0.000      LSECT   "L21"       "L17"
					POINT   "TP4"         0.000      LSECT   "L21"       "L16"
					
				TEMPERATURE END
				
				REINFTORSION "1_Torsion" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     ""   AUTO
					COVER           0.000
					
				REINFTORSION END
				
			CPROPSETS END
			
			CPROPSETS 2 BEGIN
				
				PROPERTY    IFC            OBJTYPE        "IfcBeam:BEAM"
				PROPERTY    IFC            OBJNAME        "Beam 02"
				
				REINFLONG "2_Long-Bott" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary10"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFLONG "2_Long-Top" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary11"
					DIAMETER         0.020000
					
				REINFLONG END
				
				REINFSHEARL "2_Shear-Long" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary12"
					
				REINFSHEARL END
				
				REINFSHEARW "2_Shear_WebL" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary13"
					
				REINFSHEARW END
				
				REINFSHEARW "2_Shear_WebR" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     "Boundary14"
					
				REINFSHEARW END
				
				STRESSRESULTS "2_Stress-Check" BEGIN
					
					POINT   "SP1"                    LSECT   "L22"       "Zloc"
					POINT   "SP2"                    LSECT   "L16"       "L22"
					
				STRESSRESULTS END
				
				TEMPERATURE "2_Temperature" BEGIN
					
					POINT   "TP1"         0.000      LSECT   "L22"       "Zloc"
					POINT   "TP2"         0.000      LSECT   "L22"       "L42"
					POINT   "TP3"         0.000      LSECT   "L17"       "L22"
					POINT   "TP4"         0.000      LSECT   "L16"       "L22"
					
				TEMPERATURE END
				
				REINFTORSION "2_Torsion" BEGIN
					
					MATERIAL     "EN:St500(A)"
					BOUNDARY     ""   AUTO
					COVER           0.000
					
				REINFTORSION END
				
			CPROPSETS END
			
			CGREF BEGIN
				
				POINT       "RP-1"    LSECT     "L21"     "L16"
				POINT       "RP-1L"   LSECT     "L14"     "L16"
				POINT       "RP-1R"   LSECT     "L15"     "L16"
				POINT       "RP-2"    LSECT     "L16"     "L22"
				POINT       "RP-2L"   LSECT     "L16"     "L37"
				POINT       "RP-2R"   LSECT     "L16"     "L38"
				
			CGREF END
			
		CSECTION END
		
	CSECTIONS END
	
	#---------------------------------------------------------------------------
	# Model structure
	#---------------------------------------------------------------------------
	
	STRUCTURE BEGIN
		
		GIRDER "MG" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:SUPERSTRUCTURE"
			REFAXIS         "Axis"
			CSPLANE         VERTICAL
			SBEGIN                 0.000000
			
			STATIONS BEGIN
				
				SLOCAL s001            0.000000    BEAM
				SLOCAL s002            5.000000    BEAM
				SLOCAL s003           10.000000    BEAM
				SLOCAL s004           15.000000    BEAM
				SLOCAL s005           20.000000    BEAM
				SLOCAL s006           25.000000    BEAM
				SLOCAL s007           30.000000    BEAM
				SLOCAL s008           35.000000    BEAM
				SLOCAL s009           40.000000    BEAM
				SGLOBAL s010          43.500000    BEAM
				SLOCAL s011           45.000000    BEAM
				SGLOBAL s012          46.500000    BEAM
				SLOCAL s013           50.000000    BEAM
				SLOCAL s014           55.000000    BEAM
				SLOCAL s015           60.000000    BEAM
				SLOCAL s016           65.000000    BEAM
				SLOCAL s017           70.000000    BEAM
				SLOCAL s018           75.000000    BEAM
				SLOCAL s019           80.000000    BEAM
				SLOCAL s020           85.000000    BEAM
				SLOCAL s021           90.000000    BEAM
				SLOCAL s022           95.000000    BEAM
				SLOCAL s023          100.000000    BEAM
				SLOCAL s024          105.000000    BEAM
				SGLOBAL s025         108.500000    BEAM
				SLOCAL s026          110.000000    BEAM
				SGLOBAL s027         111.500000    BEAM
				SLOCAL s028          115.000000    BEAM
				SLOCAL s029          120.000000    BEAM
				SLOCAL s030          125.000000    BEAM
				SLOCAL s031          130.000000    BEAM
				SLOCAL s032          135.000000    BEAM
				SLOCAL s033          140.000000    BEAM
				SLOCAL s034          145.000000    BEAM
				SLOCAL s035          150.000000    BEAM
				SLOCAL s036          155.000000    BEAM
				SGLOBAL s037         160.000000    BEAM
				SGLOBAL s038         165.000000    BEAM
				SGLOBAL s039         170.000000    BEAM
				SGLOBAL s040         173.500000    BEAM
				SGLOBAL s041         175.000000    BEAM
				SGLOBAL s042         176.500000    BEAM
				SGLOBAL s043         180.000000    BEAM
				SGLOBAL s044         185.000000    BEAM
				SGLOBAL s045         190.000000    BEAM
				SGLOBAL s046         195.000000    BEAM
				SGLOBAL s047         200.000000    BEAM
				SGLOBAL s048         205.000000    BEAM
				SGLOBAL s049         210.000000    BEAM
				SGLOBAL s050         215.000000    BEAM
				SGLOBAL s051         220.000000    BEAM
				
			STATIONS END
			
			SPOINT            s001              CSECTION   "" "MG"
			SPOINT      [XFTS s002   s050   1]  CSECTION   "MG"
			SPOINT            s051              CSECTION   "MG" ""
			
			SPOINT      [XFTS s001   s051   1]  ZROTATE    0.00000
			
			SPOINT      [XFTS s001   s051   1]  YROTATE    0.00000
			
			SPOINT            s001              VARIABLE   "bthickness" ""                      "bthickness(\$s)"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "bthickness" "bthickness(\$s)"
			SPOINT            s051              VARIABLE   "bthickness" "bthickness(\$s)"       ""
			SPOINT            s001              VARIABLE   "bthickness_half" ""                 "bthickness(\$s)*0.5"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "bthickness_half" "bthickness(\$s)*0.5"
			SPOINT            s051              VARIABLE   "bthickness_half" "bthickness(\$s)*0.5" ""
			SPOINT            s001              VARIABLE   "hsection"   ""                      "hsection(\$s)"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "hsection"   "hsection(\$s)"
			SPOINT            s051              VARIABLE   "hsection"   "hsection(\$s)"         ""
			SPOINT            s001              VARIABLE   "incl"       ""                      "incl(\$s)"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "incl"       "incl(\$s)"
			SPOINT            s051              VARIABLE   "incl"       "incl(\$s)"             ""
			SPOINT            s001              VARIABLE   "inclLeft"   ""                      "inclLeft(\$s)"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "inclLeft"   "inclLeft(\$s)"
			SPOINT            s051              VARIABLE   "inclLeft"   "inclLeft(\$s)"         ""
			SPOINT            s001              VARIABLE   "inclRight"  ""                      "inclRight(\$s)"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "inclRight"  "inclRight(\$s)"
			SPOINT            s051              VARIABLE   "inclRight"  "inclRight(\$s)"        ""
			SPOINT            s001              VARIABLE   "webwidth"   ""                      "webwidth(\$s)"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "webwidth"   "webwidth(\$s)"
			SPOINT            s051              VARIABLE   "webwidth"   "webwidth(\$s)"         ""
			SPOINT            s001              VARIABLE   "webwidth_half" ""                   "webwidth(\$s)*0.5"
			SPOINT      [XFTS s002   s050   1]  VARIABLE   "webwidth_half" "webwidth(\$s)*0.5"
			SPOINT            s051              VARIABLE   "webwidth_half" "webwidth(\$s)*0.5"  ""
			
			SPOINT      [XFTS s001   s051   1]  NODE       "1"             101   STEP     1
			SPOINT      [XFTS s001   s051   1]  NODE       "2"             201   STEP     1
			
			SPOINT      [XFTS s001   s050   1]  BEAM       "1"             101   STEP     1
			SPOINT      [XFTS s001   s050   1]  BEAM       "2"             201   STEP     1
			
			SPOINT      [XFTS s001   s050   1]  MATERIAL   "1"          "EN:C40/50"
			SPOINT      [XFTS s001   s050   1]  MATERIAL   "2"          "EN:C40/50"
			
			SPOINT      [XFTS s001   s050   1]  GROUP      "1"          "MG"
			SPOINT      [XFTS s001   s050   1]  GROUP      "2"          "MG"
			
			GRILLAGE "OFF" BEGIN
				
				MATERIAL         ""
				GROUP            ""
				CSECTION         ""                0.00000
				ELEMS                 0      0
				
			GRILLAGE END
			
		GIRDER END
		
		PIER "Pier 1-1" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:PIER"
			CSPLANE         HORIZONTAL
			ROTATE                        0
			
			STATIONS BEGIN
				
				SGLOBAL s001         -20.000000    BEAM
				SGLOBAL s002         -15.000000    BEAM
				SGLOBAL s003         -10.000000    BEAM
				SGLOBAL s004          -5.000000    BEAM
				SGLOBAL s005           0.000000    BEAM
				
			STATIONS END
			
			SPOINT      [XFTS s001   s004   1]  CSECTION   "Pier"
			SPOINT            s005              CSECTION   "Pier" ""
			
			
			
			
			SPOINT      [XFTS s001   s005   1]  NODE       "1"            1301   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  BEAM       "1"            1301   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  MATERIAL   "1"          "EN:C35/45"
			
			SPOINT      [XFTS s001   s004   1]  GROUP      "1"          "11"
			
		PIER END
		
		PIER "Pier 1-2" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:PIER"
			CSPLANE         HORIZONTAL
			ROTATE                        0
			
			STATIONS BEGIN
				
				SGLOBAL s001         -30.000000    BEAM
				SGLOBAL s002         -25.000000    BEAM
				SGLOBAL s003         -20.000000    BEAM
				SGLOBAL s004         -15.000000    BEAM
				SGLOBAL s005         -10.000000    BEAM
				SGLOBAL s006          -5.000000    BEAM
				SGLOBAL s007           0.000000    BEAM
				
			STATIONS END
			
			SPOINT            s001              CSECTION   "" "Pier"
			SPOINT      [XFTS s002   s006   1]  CSECTION   "Pier"
			SPOINT            s007              CSECTION   "Pier" ""
			
			
			
			
			SPOINT      [XFTS s001   s007   1]  NODE       "1"            1501   STEP     1
			
			SPOINT      [XFTS s001   s006   1]  BEAM       "1"            1501   STEP     1
			
			SPOINT      [XFTS s001   s006   1]  MATERIAL   "1"          "EN:C35/45"
			
			SPOINT      [XFTS s001   s006   1]  GROUP      "1"          "12"
			
		PIER END
		
		PIER "Pier 1-3" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:PIER"
			CSPLANE         HORIZONTAL
			ROTATE                        0
			
			STATIONS BEGIN
				
				SGLOBAL s001         -20.000000    BEAM
				SGLOBAL s002         -15.000000    BEAM
				SGLOBAL s003         -10.000000    BEAM
				SGLOBAL s004          -5.000000    BEAM
				SGLOBAL s005           0.000000    BEAM
				
			STATIONS END
			
			SPOINT      [XFTS s001   s004   1]  CSECTION   "Pier"
			SPOINT            s005              CSECTION   "Pier" ""
			
			
			
			
			SPOINT      [XFTS s001   s005   1]  NODE       "1"            1701   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  BEAM       "1"            1701   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  MATERIAL   "1"          "EN:C35/45"
			
			SPOINT      [XFTS s001   s004   1]  GROUP      "1"          "13"
			
		PIER END
		
		PIER "Pier 2-1" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:PIER"
			CSPLANE         HORIZONTAL
			ROTATE                        0
			
			STATIONS BEGIN
				
				SGLOBAL s001         -20.000000    BEAM
				SGLOBAL s002         -15.000000    BEAM
				SGLOBAL s003         -10.000000    BEAM
				SGLOBAL s004          -5.000000    BEAM
				SGLOBAL s005           0.000000    BEAM
				
			STATIONS END
			
			SPOINT      [XFTS s001   s004   1]  CSECTION   "Pier"
			SPOINT            s005              CSECTION   "Pier" ""
			
			
			
			
			SPOINT      [XFTS s001   s005   1]  NODE       "1"            1401   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  BEAM       "1"            1401   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  MATERIAL   "1"          "EN:C35/45"
			
			SPOINT      [XFTS s001   s004   1]  GROUP      "1"          "21"
			
		PIER END
		
		PIER "Pier 2-2" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:PIER"
			CSPLANE         HORIZONTAL
			ROTATE                        0
			
			STATIONS BEGIN
				
				SGLOBAL s001         -30.000000    BEAM
				SGLOBAL s002         -25.000000    BEAM
				SGLOBAL s003         -20.000000    BEAM
				SGLOBAL s004         -15.000000    BEAM
				SGLOBAL s005         -10.000000    BEAM
				SGLOBAL s006          -5.000000    BEAM
				SGLOBAL s007           0.000000    BEAM
				
			STATIONS END
			
			SPOINT            s001              CSECTION   "" "Pier"
			SPOINT      [XFTS s002   s006   1]  CSECTION   "Pier"
			SPOINT            s007              CSECTION   "Pier" ""
			
			
			
			
			SPOINT      [XFTS s001   s007   1]  NODE       "1"            1601   STEP     1
			
			SPOINT      [XFTS s001   s006   1]  BEAM       "1"            1601   STEP     1
			
			SPOINT      [XFTS s001   s006   1]  MATERIAL   "1"          "EN:C35/45"
			
			SPOINT      [XFTS s001   s006   1]  GROUP      "1"          "22"
			
		PIER END
		
		PIER "Pier 2-3" BEGIN
			
			TEXT            ""
			IFC  OBJTYPE    "IfcBridgePart:PIER"
			CSPLANE         HORIZONTAL
			ROTATE                        0
			
			STATIONS BEGIN
				
				SGLOBAL s001         -20.000000    BEAM
				SGLOBAL s002         -15.000000    BEAM
				SGLOBAL s003         -10.000000    BEAM
				SGLOBAL s004          -5.000000    BEAM
				SGLOBAL s005           0.000000    BEAM
				
			STATIONS END
			
			SPOINT      [XFTS s001   s004   1]  CSECTION   "Pier"
			SPOINT            s005              CSECTION   "Pier" ""
			
			
			
			
			SPOINT      [XFTS s001   s005   1]  NODE       "1"            1801   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  BEAM       "1"            1801   STEP     1
			
			SPOINT      [XFTS s001   s004   1]  MATERIAL   "1"          "EN:C35/45"
			
			SPOINT      [XFTS s001   s004   1]  GROUP      "1"          "23"
			
		PIER END
		
		SUPPORT "Support 1-1" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1300
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		SUPPORT END
		
		SUPPORT "Support 1-2" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1500
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		SUPPORT END
		
		SUPPORT "Support 1-3" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1700
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		SUPPORT END
		
		SUPPORT "Support 2-1" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1400
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		SUPPORT END
		
		SUPPORT "Support 2-2" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1600
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		SUPPORT END
		
		SUPPORT "Support 2-3" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEM             1800
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS         0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		SUPPORT END
		
		ABUTMENT "Abutment 1-1" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEMS            1101  1100  1102
			NODES               0  1100     0
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS L       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS C       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS R       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		ABUTMENT END
		
		ABUTMENT "Abutment 1-2" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEMS            1901  1900  1902
			NODES               0  1900     0
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS L       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS C       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS R       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		ABUTMENT END
		
		ABUTMENT "Abutment 2-1" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEMS            1201  1200  1202
			NODES               0  1200     0
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS L       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS C       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS R       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		ABUTMENT END
		
		ABUTMENT "Abutment 2-2" BEGIN
			
			TEXT            ""
			CSPLANE         HORIZONTAL
			ELEMS            2001  2000  2002
			NODES               0  2000     0
			ANGLES                0.00000      0.00000      0.00000
			STIFFNESS L       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS C       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			STIFFNESS R       0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09  0.10000E+09
			
		ABUTMENT END
		
		#-----------------------------------------------------------------------
		# Geometrical positions of structural members
		#-----------------------------------------------------------------------
		
		GPOSITIONS BEGIN
			
			PIER2GIRDER "Pier 1-1"              CGREF   "MG"            s011    FRONT   "RP-1"
			PIER2GIRDER "Pier 1-2"              CGREF   "MG"            s026    FRONT   "RP-1"
			PIER2GIRDER "Pier 1-3"              CGREF   "MG"            s041    FRONT   "RP-1"
			PIER2GIRDER "Pier 2-1"              CGREF   "MG"            s011    FRONT   "RP-2"
			PIER2GIRDER "Pier 2-2"              CGREF   "MG"            s026    FRONT   "RP-2"
			PIER2GIRDER "Pier 2-3"              CGREF   "MG"            s041    FRONT   "RP-2"
			
			SPRING2SMEM "Support 1-1"           CGREF   "Pier 1-1"      s001    FRONT   "RP-P"
			SPRING2SMEM "Support 1-2"           CGREF   "Pier 1-2"      s001    FRONT   "RP-P"
			SPRING2SMEM "Support 1-3"           CGREF   "Pier 1-3"      s001    FRONT   "RP-P"
			SPRING2SMEM "Support 2-1"           CGREF   "Pier 2-1"      s001    FRONT   "RP-P"
			SPRING2SMEM "Support 2-2"           CGREF   "Pier 2-2"      s001    FRONT   "RP-P"
			SPRING2SMEM "Support 2-3"           CGREF   "Pier 2-3"      s001    FRONT   "RP-P"
			SPRING2SMEM "Abutment 1-1:L"        CGREF   "MG"            s001    FRONT   "RP-1L"
			SPRING2SMEM "Abutment 1-1:C"        CGREF   "MG"            s001    FRONT   "RP-1"
			SPRING2SMEM "Abutment 1-1:R"        CGREF   "MG"            s001    FRONT   "RP-1R"
			SPRING2SMEM "Abutment 1-2:L"        CGREF   "MG"            s051    BACK    "RP-1L"
			SPRING2SMEM "Abutment 1-2:C"        CGREF   "MG"            s051    BACK    "RP-1"
			SPRING2SMEM "Abutment 1-2:R"        CGREF   "MG"            s051    BACK    "RP-1R"
			SPRING2SMEM "Abutment 2-1:L"        CGREF   "MG"            s001    FRONT   "RP-2L"
			SPRING2SMEM "Abutment 2-1:C"        CGREF   "MG"            s001    FRONT   "RP-2"
			SPRING2SMEM "Abutment 2-1:R"        CGREF   "MG"            s001    FRONT   "RP-2R"
			SPRING2SMEM "Abutment 2-2:L"        CGREF   "MG"            s051    BACK    "RP-2L"
			SPRING2SMEM "Abutment 2-2:C"        CGREF   "MG"            s051    BACK    "RP-2"
			SPRING2SMEM "Abutment 2-2:R"        CGREF   "MG"            s051    BACK    "RP-2R"
			
		GPOSITIONS END
		
		#-----------------------------------------------------------------------
		# Topological connections of structural members (Analysis)
		#-----------------------------------------------------------------------
		
		CONNECTIONS BEGIN
			
			RIGID       "Pier 1-1"      s005       BACK "1" TO   "MG"           s011    BACK  "1"
			RIGID       "Pier 1-2"      s007       BACK "1" TO   "MG"           s026    BACK  "1"
			RIGID       "Pier 1-3"      s005       BACK "1" TO   "MG"           s041    BACK  "1"
			RIGID       "Pier 2-1"      s005       BACK "1" TO   "MG"           s011    BACK  "2"
			RIGID       "Pier 2-2"      s007       BACK "1" TO   "MG"           s026    BACK  "2"
			RIGID       "Pier 2-3"      s005       BACK "1" TO   "MG"           s041    BACK  "2"
			RIGID       "Abutment 1-1"  FRONT "L"           TO   "MG"
			RIGID       "Abutment 1-1"  FRONT "R"           TO   "MG"
			RIGID       "Abutment 1-2"  FRONT "L"           TO   "MG"
			RIGID       "Abutment 1-2"  FRONT "R"           TO   "MG"
			RIGID       "Support 2-1"   FRONT               TO   "Pier 2-1"     s001    FRONT  "1"
			RIGID       "Support 2-2"   FRONT               TO   "Pier 2-2"     ""      ""  "1"
			RIGID       "Support 2-3"   FRONT               TO   "Pier 2-3"     ""      ""  "1"
			RIGID       "Abutment 2-1"  FRONT "L"           TO   "MG"           ""      ""  "2"
			RIGID       "Abutment 2-1"  FRONT "R"           TO   "MG"           ""      ""  "2"
			RIGID       "Abutment 2-2"  FRONT "L"           TO   "MG"           ""      ""  "2"
			RIGID       "Abutment 2-2"  FRONT "R"           TO   "MG"           ""      ""  "2"
			RIGID       "Support 1-1"   FRONT               TO   "Pier 1-1"     s001    FRONT
			RIGID       "Support 1-2"   FRONT               TO   ""
			RIGID       "Support 1-3"   FRONT               TO   ""
			
		CONNECTIONS END
		
	STRUCTURE END
	
	#---------------------------------------------------------------------------
	# Construction
	#---------------------------------------------------------------------------
	
	CONSTRUCTION "Construction" BEGIN
		
		TEXT       ""
		DAYBEGIN   1
		OPTION     CALCULATION       ON
		
		PHASE "Phase 1-1" BEGIN
			
			TEXT       ""
			DAYBEGIN   1
			
			ASSEMBLIES BEGIN
				
				ASM        1  MEMBER    "Pier 1-2"    BEAM  *    SGLOBAL   -30.000000     SGLOBAL   -25.000000
				ASM        2  MEMBER    "Pier 1-2"    BEAM  *    SGLOBAL   -25.000000     SGLOBAL   -20.000000
				ASM        3  MEMBER    "Pier 1-1"    BEAM  *    SGLOBAL   -20.000000     SGLOBAL   -15.000000
				ASM        3  MEMBER    "Pier 1-2"    BEAM  *    SGLOBAL   -20.000000     SGLOBAL   -15.000000
				ASM        3  MEMBER    "Pier 1-3"    BEAM  *    SGLOBAL   -20.000000     SGLOBAL   -15.000000
				ASM        4  MEMBER    "Pier 1-1"    BEAM  *    SGLOBAL   -15.000000     SGLOBAL   -10.000000
				ASM        4  MEMBER    "Pier 1-2"    BEAM  *    SGLOBAL   -15.000000     SGLOBAL   -10.000000
				ASM        4  MEMBER    "Pier 1-3"    BEAM  *    SGLOBAL   -15.000000     SGLOBAL   -10.000000
				ASM        5  MEMBER    "Pier 1-1"    BEAM  *    SGLOBAL   -10.000000     SGLOBAL   -5.000000
				ASM        5  MEMBER    "Pier 1-2"    BEAM  *    SGLOBAL   -10.000000     SGLOBAL   -5.000000
				ASM        5  MEMBER    "Pier 1-3"    BEAM  *    SGLOBAL   -10.000000     SGLOBAL   -5.000000
				ASM        6  MEMBER    "Pier 1-1"    BEAM  *    SGLOBAL   -5.000000      SGLOBAL   0.000000
				ASM        6  MEMBER    "Pier 1-2"    BEAM  *    SGLOBAL   -5.000000      SGLOBAL   0.000000
				ASM        6  MEMBER    "Pier 1-3"    BEAM  *    SGLOBAL   -5.000000      SGLOBAL   0.000000
				ASM        7  MEMBER    "Support 1-2" UNIT  *    SGLOBAL   *              SGLOBAL   *
				ASM        8  MEMBER    "Support 1-1" UNIT  *    SGLOBAL   *              SGLOBAL   *
				ASM        8  MEMBER    "Support 1-3" UNIT  *    SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    CONCRETE             1 LOCAL     10     1           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            10 LOCAL     10     2           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            20 LOCAL     10     3           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            30 LOCAL     10     4           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            40 LOCAL     10     5           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            50 LOCAL     10     6           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    INSTSUPP             1 LOCAL      0     7           "descr=Activate bearings/springs"
				TASK    INSTSUPP             1 LOCAL      0     8           "descr=Activate bearings/springs"
				
			TASKS END
			
		PHASE END
		
		PHASE "Phase 1-2" BEGIN
			
			TEXT       ""
			DAYBEGIN   60
			
			ASSEMBLIES BEGIN
				
				ASM        1  MEMBER    "MG"          BEAM  1    SLOCAL    40.000000      SLOCAL    50.000000
				ASM        1  MEMBER    "MG"          BEAM  1    SLOCAL    105.000000     SLOCAL    115.000000
				ASM        1  MEMBER    "MG"          BEAM  1    SGLOBAL   170.000000     SGLOBAL   180.000000
				ASM        2  MEMBER    "MG"          BEAM  1    SLOCAL    35.000000      SLOCAL    40.000000
				ASM        2  MEMBER    "MG"          BEAM  1    SLOCAL    50.000000      SLOCAL    55.000000
				ASM        2  MEMBER    "MG"          BEAM  1    SLOCAL    100.000000     SLOCAL    105.000000
				ASM        2  MEMBER    "MG"          BEAM  1    SLOCAL    115.000000     SLOCAL    120.000000
				ASM        2  MEMBER    "MG"          BEAM  1    SGLOBAL   165.000000     SGLOBAL   170.000000
				ASM        2  MEMBER    "MG"          BEAM  1    SGLOBAL   180.000000     SGLOBAL   185.000000
				ASM        3  MEMBER    "MG"          BEAM  1    SLOCAL    30.000000      SLOCAL    35.000000
				ASM        3  MEMBER    "MG"          BEAM  1    SLOCAL    55.000000      SLOCAL    60.000000
				ASM        3  MEMBER    "MG"          BEAM  1    SLOCAL    95.000000      SLOCAL    100.000000
				ASM        3  MEMBER    "MG"          BEAM  1    SLOCAL    120.000000     SLOCAL    125.000000
				ASM        3  MEMBER    "MG"          BEAM  1    SGLOBAL   160.000000     SGLOBAL   165.000000
				ASM        3  MEMBER    "MG"          BEAM  1    SGLOBAL   185.000000     SGLOBAL   190.000000
				ASM        4  MEMBER    "MG"          BEAM  1    SLOCAL    25.000000      SLOCAL    30.000000
				ASM        4  MEMBER    "MG"          BEAM  1    SLOCAL    60.000000      SLOCAL    65.000000
				ASM        4  MEMBER    "MG"          BEAM  1    SLOCAL    90.000000      SLOCAL    95.000000
				ASM        4  MEMBER    "MG"          BEAM  1    SLOCAL    125.000000     SLOCAL    130.000000
				ASM        4  MEMBER    "MG"          BEAM  1    SLOCAL    155.000000     SGLOBAL   160.000000
				ASM        4  MEMBER    "MG"          BEAM  1    SGLOBAL   190.000000     SGLOBAL   195.000000
				ASM        5  MEMBER    "MG"          BEAM  1    SLOCAL    20.000000      SLOCAL    25.000000
				ASM        5  MEMBER    "MG"          BEAM  1    SLOCAL    65.000000      SLOCAL    70.000000
				ASM        5  MEMBER    "MG"          BEAM  1    SLOCAL    85.000000      SLOCAL    90.000000
				ASM        5  MEMBER    "MG"          BEAM  1    SLOCAL    130.000000     SLOCAL    135.000000
				ASM        5  MEMBER    "MG"          BEAM  1    SLOCAL    150.000000     SLOCAL    155.000000
				ASM        5  MEMBER    "MG"          BEAM  1    SGLOBAL   195.000000     SGLOBAL   200.000000
				ASM        6  MEMBER    "MG"          BEAM  1    SLOCAL    15.000000      SLOCAL    20.000000
				ASM        6  MEMBER    "MG"          BEAM  1    SLOCAL    70.000000      SLOCAL    75.000000
				ASM        6  MEMBER    "MG"          BEAM  1    SLOCAL    80.000000      SLOCAL    85.000000
				ASM        6  MEMBER    "MG"          BEAM  1    SLOCAL    135.000000     SLOCAL    140.000000
				ASM        6  MEMBER    "MG"          BEAM  1    SLOCAL    145.000000     SLOCAL    150.000000
				ASM        6  MEMBER    "MG"          BEAM  1    SGLOBAL   200.000000     SGLOBAL   205.000000
				ASM        7  MEMBER    "MG"          BEAM  1    SLOCAL    10.000000      SLOCAL    15.000000
				ASM        7  MEMBER    "MG"          BEAM  1    SLOCAL    75.000000      SLOCAL    80.000000
				ASM        7  MEMBER    "MG"          BEAM  1    SLOCAL    140.000000     SLOCAL    145.000000
				ASM        7  MEMBER    "MG"          BEAM  1    SGLOBAL   205.000000     SGLOBAL   210.000000
				ASM        8  MEMBER    "MG"          BEAM  1    SLOCAL    0.000000       SLOCAL    10.000000
				ASM        8  MEMBER    "MG"          BEAM  1    SGLOBAL   210.000000     SGLOBAL   220.000000
				ASM        9  MEMBER    "Abutment 1-1" UNIT  *   SGLOBAL   *              SGLOBAL   *
				ASM        9  MEMBER    "Abutment 1-2" UNIT  *   SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    CONCRETE             1 LOCAL      7     1           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE             8 LOCAL      7     2           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            15 LOCAL      7     3           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            22 LOCAL      7     4           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            29 LOCAL      7     5           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            36 LOCAL      7     6           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            43 LOCAL      7     7           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            50 LOCAL      7     8           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    INSTSUPP            50 LOCAL      0     9           "descr=Activate bearings/springs"
				
			TASKS END
			
		PHASE END
		
		PHASE "Phase 2-1" BEGIN
			
			TEXT       ""
			DAYBEGIN   57
			
			ASSEMBLIES BEGIN
				
				ASM        1  MEMBER    "Pier 2-2"    BEAM  *    SGLOBAL   -30.000000     SGLOBAL   -25.000000
				ASM        2  MEMBER    "Pier 2-2"    BEAM  *    SGLOBAL   -25.000000     SGLOBAL   -20.000000
				ASM        3  MEMBER    "Pier 2-1"    BEAM  *    SGLOBAL   -20.000000     SGLOBAL   -15.000000
				ASM        3  MEMBER    "Pier 2-2"    BEAM  *    SGLOBAL   -20.000000     SGLOBAL   -15.000000
				ASM        3  MEMBER    "Pier 2-3"    BEAM  *    SGLOBAL   -20.000000     SGLOBAL   -15.000000
				ASM        4  MEMBER    "Pier 2-1"    BEAM  *    SGLOBAL   -15.000000     SGLOBAL   -10.000000
				ASM        4  MEMBER    "Pier 2-2"    BEAM  *    SGLOBAL   -15.000000     SGLOBAL   -10.000000
				ASM        4  MEMBER    "Pier 2-3"    BEAM  *    SGLOBAL   -15.000000     SGLOBAL   -10.000000
				ASM        5  MEMBER    "Pier 2-1"    BEAM  *    SGLOBAL   -10.000000     SGLOBAL   -5.000000
				ASM        5  MEMBER    "Pier 2-2"    BEAM  *    SGLOBAL   -10.000000     SGLOBAL   -5.000000
				ASM        5  MEMBER    "Pier 2-3"    BEAM  *    SGLOBAL   -10.000000     SGLOBAL   -5.000000
				ASM        6  MEMBER    "Pier 2-1"    BEAM  *    SGLOBAL   -5.000000      SGLOBAL   0.000000
				ASM        6  MEMBER    "Pier 2-2"    BEAM  *    SGLOBAL   -5.000000      SGLOBAL   0.000000
				ASM        6  MEMBER    "Pier 2-3"    BEAM  *    SGLOBAL   -5.000000      SGLOBAL   0.000000
				ASM        7  MEMBER    "Support 2-2" UNIT  *    SGLOBAL   *              SGLOBAL   *
				ASM        8  MEMBER    "Support 2-1" UNIT  *    SGLOBAL   *              SGLOBAL   *
				ASM        8  MEMBER    "Support 2-3" UNIT  *    SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    CONCRETE             1 LOCAL     10     1           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            10 LOCAL     10     2           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            20 LOCAL     10     3           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            30 LOCAL     10     4           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            40 LOCAL     10     5           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            50 LOCAL     10     6           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    INSTSUPP             1 LOCAL      0     7           "descr=Activate bearings/springs"
				TASK    INSTSUPP             1 LOCAL      0     8           "descr=Activate bearings/springs"
				
			TASKS END
			
		PHASE END
		
		PHASE "Phase 2-2" BEGIN
			
			TEXT       ""
			DAYBEGIN   117
			
			ASSEMBLIES BEGIN
				
				ASM        1  MEMBER    "MG"          BEAM  2    SLOCAL    40.000000      SLOCAL    50.000000
				ASM        1  MEMBER    "MG"          BEAM  2    SLOCAL    105.000000     SLOCAL    115.000000
				ASM        1  MEMBER    "MG"          BEAM  2    SGLOBAL   170.000000     SGLOBAL   180.000000
				ASM        2  MEMBER    "MG"          BEAM  2    SLOCAL    35.000000      SLOCAL    40.000000
				ASM        2  MEMBER    "MG"          BEAM  2    SLOCAL    50.000000      SLOCAL    55.000000
				ASM        2  MEMBER    "MG"          BEAM  2    SLOCAL    100.000000     SLOCAL    105.000000
				ASM        2  MEMBER    "MG"          BEAM  2    SLOCAL    115.000000     SLOCAL    120.000000
				ASM        2  MEMBER    "MG"          BEAM  2    SGLOBAL   165.000000     SGLOBAL   170.000000
				ASM        2  MEMBER    "MG"          BEAM  2    SGLOBAL   180.000000     SGLOBAL   185.000000
				ASM        3  MEMBER    "MG"          BEAM  2    SLOCAL    30.000000      SLOCAL    35.000000
				ASM        3  MEMBER    "MG"          BEAM  2    SLOCAL    55.000000      SLOCAL    60.000000
				ASM        3  MEMBER    "MG"          BEAM  2    SLOCAL    95.000000      SLOCAL    100.000000
				ASM        3  MEMBER    "MG"          BEAM  2    SLOCAL    120.000000     SLOCAL    125.000000
				ASM        3  MEMBER    "MG"          BEAM  2    SGLOBAL   160.000000     SGLOBAL   165.000000
				ASM        3  MEMBER    "MG"          BEAM  2    SGLOBAL   185.000000     SGLOBAL   190.000000
				ASM        4  MEMBER    "MG"          BEAM  2    SLOCAL    25.000000      SLOCAL    30.000000
				ASM        4  MEMBER    "MG"          BEAM  2    SLOCAL    60.000000      SLOCAL    65.000000
				ASM        4  MEMBER    "MG"          BEAM  2    SLOCAL    90.000000      SLOCAL    95.000000
				ASM        4  MEMBER    "MG"          BEAM  2    SLOCAL    125.000000     SLOCAL    130.000000
				ASM        4  MEMBER    "MG"          BEAM  2    SLOCAL    155.000000     SGLOBAL   160.000000
				ASM        4  MEMBER    "MG"          BEAM  2    SGLOBAL   190.000000     SGLOBAL   195.000000
				ASM        5  MEMBER    "MG"          BEAM  2    SLOCAL    20.000000      SLOCAL    25.000000
				ASM        5  MEMBER    "MG"          BEAM  2    SLOCAL    65.000000      SLOCAL    70.000000
				ASM        5  MEMBER    "MG"          BEAM  2    SLOCAL    85.000000      SLOCAL    90.000000
				ASM        5  MEMBER    "MG"          BEAM  2    SLOCAL    130.000000     SLOCAL    135.000000
				ASM        5  MEMBER    "MG"          BEAM  2    SLOCAL    150.000000     SLOCAL    155.000000
				ASM        5  MEMBER    "MG"          BEAM  2    SGLOBAL   195.000000     SGLOBAL   200.000000
				ASM        6  MEMBER    "MG"          BEAM  2    SLOCAL    15.000000      SLOCAL    20.000000
				ASM        6  MEMBER    "MG"          BEAM  2    SLOCAL    70.000000      SLOCAL    75.000000
				ASM        6  MEMBER    "MG"          BEAM  2    SLOCAL    80.000000      SLOCAL    85.000000
				ASM        6  MEMBER    "MG"          BEAM  2    SLOCAL    135.000000     SLOCAL    140.000000
				ASM        6  MEMBER    "MG"          BEAM  2    SLOCAL    145.000000     SLOCAL    150.000000
				ASM        6  MEMBER    "MG"          BEAM  2    SGLOBAL   200.000000     SGLOBAL   205.000000
				ASM        7  MEMBER    "MG"          BEAM  2    SLOCAL    10.000000      SLOCAL    15.000000
				ASM        7  MEMBER    "MG"          BEAM  2    SLOCAL    75.000000      SLOCAL    80.000000
				ASM        7  MEMBER    "MG"          BEAM  2    SLOCAL    140.000000     SLOCAL    145.000000
				ASM        7  MEMBER    "MG"          BEAM  2    SGLOBAL   205.000000     SGLOBAL   210.000000
				ASM        8  MEMBER    "MG"          BEAM  2    SLOCAL    0.000000       SLOCAL    10.000000
				ASM        8  MEMBER    "MG"          BEAM  2    SGLOBAL   210.000000     SGLOBAL   220.000000
				ASM        9  MEMBER    "Abutment 2-2" UNIT  *   SGLOBAL   *              SGLOBAL   *
				ASM        9  MEMBER    "Abutment 2-1" UNIT  *   SGLOBAL   *              SGLOBAL   *
				
			ASSEMBLIES END
			
			TASKS BEGIN
				
				#task   taskname          day1     duration assembly [SKIP] additional args
				TASK    CONCRETE             1 LOCAL      7     1           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE             8 LOCAL      7     2           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            15 LOCAL      7     3           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            22 LOCAL      7     4           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            29 LOCAL      7     5           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            36 LOCAL      7     6           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            43 LOCAL      7     7           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    CONCRETE            50 LOCAL      7     8           "Dshrink=0" "descr=Concrete (pour + curing)"
				TASK    INSTSUPP            50 LOCAL      0     9           "descr=Activate bearings/springs"
				
			TASKS END
			
		PHASE END
		
	CONSTRUCTION END
	
ABM END

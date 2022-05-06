--- Libraries needed to have certain features
library IEEE;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;

ENTITY CalculatorProject IS
PORT (
	digit1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	digit2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	addition : IN BIT;
	subtraction : IN BIT;
	multiplication : IN BIT;
	division : IN BIT;
	LED_out : OUT BIT_VECTOR (6 DOWNTO 0);
	LED_out2 : OUT BIT_VECTOR (6 DOWNTO 0);
	LED_out3 : OUT BIT_VECTOR (6 DOWNTO 0));

END CalculatorProject;


ARCHITECTURE Logic OF CalculatorProject IS
	SIGNAL number : integer; -- the answer
	SIGNAL num1 : integer;
	SIGNAL num2 : integer;
	SIGNAL num3 : integer;
	SIGNAL dig1 : integer; -- The two numbers
	SIGNAL dig2 : integer; -- The two numbers
	BEGIN
	
	-- Process to handle the arthmitic
	PROCESS (digit1, digit2, addition, subtraction, multiplication, division)
	BEGIN
		-- Converts the logic vectors to integers to have operation done on them
		dig1 <= to_integer(unsigned(digit1));
		dig2 <= to_integer(unsigned(digit2));
		
		-- Does the addition logic if the addition button is pressed
		IF (addition = '0') THEN
			number <= dig1 + dig2;
		END IF;
		
		-- Does the substraction logic if the subtraction button is pressed
		IF (subtraction = '0') THEN
			IF ((dig1 - dig2) >= 0) THEN
				number <= dig1 - dig2;
			ELSE
				number <= 0;
			END IF;
		END IF;	

		-- Multiplication logic
		IF (multiplication = '0') THEN
			number <= dig1 * dig2;
		END IF;
		
		IF (division = '0') THEN
			IF (dig2 > 0) THEN
				IF ((dig1 MOD dig2) = 0) THEN
					number <= dig1 / dig2;
				ELSE
					number <= 0;
				END IF;
				ELSE
					number <= 0;
			END IF;
		END IF;
		
		num1 <= number MOD 10;
		num2 <= number MOD 100/10;
		num3 <= number MOD 1000/100;
		
	END PROCESS;
	
	
	PROCESS (num1, num2, num3)
	BEGIN
		CASE num1 IS
		WHEN 0 => LED_out <= "1000000";
		WHEN 1 => LED_out <= "1111001";
		WHEN 2 => LED_out <= "0100100";
		WHEN 3 => LED_out <= "0110000";
		WHEN 4 => LED_out <= "0011001";
		WHEN 5 => LED_out <= "0010010";
		WHEN 6 => LED_out <= "0000010";
		WHEN 7 => LED_out <= "1111000";
		WHEN 8 => LED_out <= "0000000";
		WHEN 9 => LED_out <= "0010000";
		WHEN OTHERS => LED_out <= "1111111";
		END CASE;
		
		CASE num2 IS
		WHEN 0 => LED_out2 <= "1000000";
		WHEN 1 => LED_out2 <= "1111001";
		WHEN 2 => LED_out2 <= "0100100";
		WHEN 3 => LED_out2 <= "0110000";
		WHEN 4 => LED_out2 <= "0011001";
		WHEN 5 => LED_out2 <= "0010010";
		WHEN 6 => LED_out2 <= "0000010";
		WHEN 7 => LED_out2 <= "1111000";
		WHEN 8 => LED_out2 <= "0000000";
		WHEN 9 => LED_out2 <= "0010000";
		WHEN OTHERS => LED_out2 <= "1111111";
		END CASE;
		
		CASE num3 IS
		WHEN 0 => LED_out3 <= "1000000";
		WHEN 1 => LED_out3 <= "1111001";
		WHEN 2 => LED_out3 <= "0100100";
		WHEN 3 => LED_out3 <= "0110000";
		WHEN 4 => LED_out3 <= "0011001";
		WHEN 5 => LED_out3 <= "0010010";
		WHEN 6 => LED_out3 <= "0000010";
		WHEN 7 => LED_out3 <= "1111000";
		WHEN 8 => LED_out3 <= "0000000";
		WHEN 9 => LED_out3 <= "0010000";
		WHEN OTHERS => LED_out3 <= "1111111";
		END CASE;
	END PROCESS;

END Logic;

-- declare 

--     no_ INT;
--     tempno int;
--     rem_ int;
--     sum_ int :=0;
--     count_ int :=0;
--     l_no int;


-- BEGIN
--     no_ := &no_;
--     tempno := no_;
--     l_no :=no_;

--     IF no_ = 0 THEN
--         count_ := 1;
--     END IF;

--     while(l_no>0)
--     loop
--         count_ := count_ + 1;
--         l_no := TRUNC(l_no / 10);
--     end loop;

--     WHILE(tempno > 0) 
--     loop 

--         rem_ := mod(tempno , 10);
--         sum_ := sum_ + power(rem_ , count_);
--         tempno := TRUNC(tempno / 10);
--     end loop;

--     if sum_ = no_ then
--         dbms_output.put_line(no_ || ' is armstrong number.');
--     else
--         dbms_output.put_line(no_ || ' is not armstrong number.');
--     end if;
-- end;
-- /


-- with function : 
CREATE OR REPLACE FUNCTION is_armstrong(
    p_num NUMBER
)
RETURN VARCHAR2
IS
    tempno  NUMBER;
    rem_    NUMBER;
    sum_    NUMBER := 0;
    count_  NUMBER := 0;
    l_no    NUMBER;
BEGIN
    tempno := p_num;
    l_no := p_num;

    IF p_num = 0 THEN
        count_ := 1;
    END IF;

    
    WHILE l_no > 0 LOOP
        count_ := count_ + 1;
        l_no := TRUNC(l_no / 10);
    END LOOP;

    WHILE tempno > 0 LOOP
        rem_ := MOD(tempno, 10);
        sum_ := sum_ + POWER(rem_, count_);
        tempno := TRUNC(tempno / 10);
    END LOOP;

    IF sum_ = p_num THEN
        RETURN 'Armstrong Number';
    ELSE
        RETURN 'Not Armstrong Number';
    END IF;
END;
/

DECLARE
    result_ VARCHAR2(50);
BEGIN
    result_ := is_armstrong(153);

    DBMS_OUTPUT.PUT_LINE(result_);
END;
/


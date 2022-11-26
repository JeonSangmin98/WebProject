create sequence seq_board;

create table tbl_board(
    boardNo number(10,0),   -- 게시글 번호   
    title varchar2(200) not null,   -- 게시글 제목   
    content varchar2(2000) not null,    -- 게시글 내용
    writer varchar2(50) not null,   -- 게시글 작성자  
    regdate date default sysdate,   -- 게시글 작성일
    updatedate date default sysdate     -- 게시글 수정일  
);
alter table tbl_board add CONSTRAINT pk_board primary key(boardNo);


insert into tbl_board(boardNo, title, content, writer)
    values(seq_board.nextval, '테스트 제목','테스트 내용','user00');
    
select * from tbl_board;
select count(*) from tbl_board;
select * from tbl_board order by boardNo desc;
select /*+ INDEX_DESC(tbl_board pk_board) */ *
    from tbl_board where boardNo > 0;
select boardNo, title, content, writer, regdate, updateDate, replyCnt from
    (select /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, boardNo, title, content, writer, regdate, updateDate, replyCnt
        from tbl_board where rownum <= 10)
    where rn > 0;
    

insert into tbl_board(boardNo, title, content, writer) 
    (select seq_board.nextval, title, content, writer from tbl_board);

create SEQUENCE seq_reply;
create table tbl_reply(
    replyNo number(10,0),   -- 댓글 번호    
    boardNo number(10,0) not null,  --게시글 번호    
    reply varchar2(1000) not null,  -- 댓글 내용
    replyer varchar2(50) not null,  -- 댓글 작성자   
    replyDate date default sysdate, -- 댓글 작성일   
    updateDate date default sysdate -- 댓글 수정
);
-- pk
alter table tbl_reply add constraint pk_reply primary key(replyNo);
-- fk
alter table tbl_reply add constraint fk_reply foreign key(boardNo) references tbl_board(boardNo);

-- index 
create index idx_reply on tbl_reply(boardNo desc, replyNo asc);

select * from tbl_reply order by replyNo desc;
select /*+INDEX(tbl_reply idx_reply) */ 
    rownum rn, boardNo, replyNo, reply, relpyer, replyDate, updatedate
     from tbl_reply where boardNo = 2816 and replyNo > 0;
select replyNo, boardNo, reply, replyer, replyDate, updatedate
from ( select /*+INDEX(tbl_reply idx_reply) */
            rownum rn, boardNo, replyNo, reply, replyer, replyDate, updatedate
        from tbl_reply
        where boardNo = 2817 and replyNo > 0 and rownum <= 20 )
        where rn > 10;
select * from tbl_reply;
-- tbl_board에 replyCnt 추가  
alter table tbl_board add (replyCnt number default 0);
-- 기존의 댓글 replyCnt에 반영  
update tbl_board set replyCnt = (select count(replyNo) from tbl_reply where tbl_reply.boardNo = tbl_board.boardNo);

-- 도서정보
create table tbl_book (
    bno number(20, 0), --책 번호 seq 사용
    author varchar2(100), --저자
    title varchar2(200), --제목
    discount number(20, 0), --가격
    pubdate date, --책 출판일 
    isbn number(20, 0), --책 고유번호
    image varchar2(300), -- 책 이미지
    category varchar2(20), --카테고리
    publisher varchar2(100), --책 출판사
    description varchar2(4000) --책 상세정보
);
create SEQUENCE seq_book;
alter table tbl_book add constraint pk_book primary key(bno);
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (1,'최창남','신들의 땅 (섬오름 이야기)',16200,to_date('22/09/15','RR/MM/DD'),9788964621806,'https://shopping-phinf.pstatic.net/main_3472854/34728544630.20221019134837.jpg','여행','뿌리와이파리','신들의 거처, 열네 개의 오름을 소요하는 매혹적인 에세이-

설문대할망이 창조한 제주의 또다른 이야기

제주도 사람들에게 그들이 몸 기대어 사는 섬은 한반도 남단에 있는 그저 하나의 섬이 아니라 우주의 중심이 자리하고 있는 세계였다. 우주였다. 하여 육지와는 다른 독립된 신화와 전설들을 무수히 품고 있다. 이 섬을 창조한 신은 설문대할망이다. 설문대할망은 이 섬을 창조했지만 그녀가 창조한 섬 가운데 자리한 한라산에 있던 깊이를 알 수 없다는 물장오리 습지에 빠져 죽었다고 수많은 신화와 설화들은 말하고 있다. 하지만 저자는 설문대할망이 깊이를 알 수 없는 물장오리 습지에 빠져 죽은 것이 아니라 무거운 육신을 벗은 것이라고 생각한다. 육신을 벗고 한라산 깊이 흐르는 살아 있는 물과 함께 흘러 섬 곳곳마다 있는 물통을 통해 다니며 그녀가 창조한 이 세계를, 이 섬의 구석구석을, 사람들을, 이 섬에 기대어 사는 숱한 생명들을 지키고 있다고 생각한다. 바람이 되어 이 섬과 사람들과 생명들을 지키고 있다고 믿는다. 
이 섬은 설문대할망이 창조했고, 일만팔천이나 되는 신들이 사는 신들의 땅이다. 눈길 닿는 곳마다, 나무마다 돌마다 신들의 손길이 어려 있다. 하지만, 그 신들이 사람들이 몸 기대어 살아가라고 내어준 사람들의 땅이기도 하다. 이 섬은 숱한 생명들이 생명을 잃고 또 회복하며 어우러져 살아가는 생명의 땅이다. 이 책은 그런 이야기들을 하고 있다.  
저자 최창남은 오름 트래킹에 대한 이야기를 쓴다고 하더니 이런 이야기들을 들고 왔다. 오름 트래킹을 말하면서도 이런 이야기를 하고 있다. 아니 이런 이야기의 얼개 안에 오름 트래킹 이야기를 풀어놓고 있다. 그래서 더 흥미롭다. 저자는 이런 이야기를 세 권의 책에 풀어놓을 예정이다. 이 책 『신들의 땅』은 그 첫째 이야기이다. 첫 권이다. 둘째 이야기는 ‘사람들의 땅’이고, 셋째 이야기는 ‘생명의 땅’이다. 저자는 이렇게 말한다. 

“이 책은 제가 이 섬에 몸 기대어 살며 만나고 보고 느낀 이 섬, 이 땅에 대한 이야기입니다. 이 땅에 대한 저의 세계관에 대한 이야기입니다. 오름을 소재로 하였고, 오름 이야기이니 오름 트래킹 책인 것은 분명하지만, 오름을 품어낸 이 땅의 이야기이며, 그 땅에 살을 섞으며 살아가는 사람들의 이야기이며, 제 이야기이기도 합니다. 이 섬에 대한 저의 행복한 고백입니다. 이 섬이 품고 있었으나 늘 이 섬 너머에 있던 세상에 대한 이야기이기도 합니다. 그런 이야기들을 진지하지 않게, 무겁지 않고, 가벼운 마음으로 트래킹하듯 읽을 수 있도록 쓰려고 마음 기울였습니다.”');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (2,'장용준','교토 갈까? (한 권으로 떠나는 한 도시 이야기)',18000,to_date('22/11/01','RR/MM/DD'),9791189034689,'https://shopping-phinf.pstatic.net/main_3537185/35371854681.20221027194508.jpg','여행','서유재','‘한 권으로 떠나는 한 도시 이야기’ 시리즈의 두 번째 책. 전작인 『파리 갈까?』에 이어 이번에는 일본의 천년고도 교토로 떠난다. 
『교토 갈까?』는 우리에게 익숙한 금각사와 은각사, 청수사, 철학의 길 등은 물론 100여 개의 대표적 유물·유적을 중심으로 동서남북 종횡무진 교토를 누비며 일본의 역사와 문화, 정치, 예술을 담아 놓았다. 특히 무심코 지나치기 쉬운 한일사의 자취도 빼놓지 않는다. 역사가이기도 한 저자는 우리의 시각과 관점에서 바라봐야 할 지점들을 섬세하게 살펴주고 새롭게 해석해 볼 수 있도록 안내한다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (3,'윤인성','혼자 공부하는 파이썬 (1:1 과외하듯 배우는 프로그래밍 자습서)',19800,to_date('22/06/01','RR/MM/DD'),9791162245651,'https://shopping-phinf.pstatic.net/main_3250760/32507605957.20221019133018.jpg','IT','한빛미디어','『혼자 공부하는 파이썬』이 더욱 흥미있고 알찬 내용으로 개정되었습니다. 프로그래밍이 정말 처음인 입문자도 따라갈 수 있는 친절한 설명과 단계별 학습은 그대로! 혼자 공부하더라도 체계적으로 계획을 세워 학습할 수 있도록 ‘혼공 계획표’를 새롭게 추가했습니다. 또한 입문자가 자주 물어보는 질문과 오류 해결 방법을 적재적소에 배치하여 예상치 못한 문제에 부딪혀도 좌절하지 않고 끝까지 완독할 수 있도록 도와줍니다. 단순한 문법 암기와 코딩 따라하기에 지쳤다면, 새로운 혼공파와 함께 ‘누적 예제’와 ‘도전 문제’로 프로그래밍의 신세계를 경험해 보세요! 배운 내용을 씹고 뜯고 맛보고 즐기다 보면 응용력은 물론 알고리즘 사고력까지 키워 코딩 실력이 쑥쑥 성장할 것입니다.

혼자 해도 충분하다! 1:1 과외하듯 배우는 파이썬 프로그래밍 자습서
이 책은 독학으로 파이썬을 배우는 입문자가 ‘꼭 필요한 내용을 제대로 학습’할 수 있도록 구성했습니다. 뭘 모르는지조차 모르는 입문자의 막연한 마음에 십분 공감하여 과외 선생님이 알려주듯 친절하게, 핵심적인 내용만 콕콕 집어줍니다. 책의 첫 페이지를 펼쳐서 마지막 페이지를 덮을 때까지, 혼자서도 충분히 파이썬을 배울 수 있다는 자신감과 확신이 계속될 것입니다!

베타리더 검증으로, ‘함께 만든’ 입문자 맞춤형 도서
베타리더와 함께 입문자에게 맞는 난이도, 분량, 학습 요소 등을 적극 반영했습니다. 어려운 용어와 개념은 한 번 더 풀어쓰고, 복잡한 설명은 눈에 잘 들어오는 그림으로 풀어냈습니다. ‘혼자 공부해 본’ 여러 입문자의 초심과 눈높이가 책 곳곳에 반영된 것이 이 책의 가장 큰 장점입니다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (4,'류영하','대만 산책',16200,to_date('22/06/20','RR/MM/DD'),9791191131376,'https://shopping-phinf.pstatic.net/main_3271835/32718359658.20221019152750.jpg','여행','이숲','인문학 가이드를 따라 대만 톺아보기

역병의 족쇄에서 잠시 풀려나 그간 꾹꾹 눌러뒀던 여행 욕구를 조금이나마 충족할 수 있게 됐다. 
여행지로 대만은 어떨까? 관광 가이드북에서 소개하는 명소 찾아다니기나 인스타그램 사진 올리기 여행이 아니라 타지인들은 잘 모르는 진짜 대만을 만나보는 건 어떨까? 
역사적으로 문화적으로 대만은 대단히 흥미로운 나라이지만, 사실 우리는 대만을 잘 모른다. 대만 관련 책을 찾아보면 관광지와 먹거리를 소개하는 책은 많지만, 대만의 역사와 문화에 관해 풀어쓴 책은 드물다.
이 책은 오랜 세월 대만과 인연을 맺고, 대만에서 살며 공부하고, 대만 대학에서 가르치고 여러 해 대만 곳곳을 돌아다니며 그들의 음식, 풍습, 역사, 정서, 문화를 탐색한 인문학자의 관찰과 성찰의 내용을 담고 있다. 특히 저자는 EBS TV [세계태마기행] 대만 편에서 큐레이터로 활동한 경험을 살려 대만의 생생한 현실을 실감나게 소개한다. 아울러 저자가 오랜 기간에 걸쳐 현장에서 촬영한 600여 컷의 사진이 책의 곳곳에 배치돼 있어 독자들에게 현장감 있는 볼거리를 제공한다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (5,'하루','뉴욕에 살고 있습니다 (유튜버 하루데이가 기록한 낭만적인 도시 풍경)',14400,to_date('22/08/16','RR/MM/DD'),9791167820860,'https://shopping-phinf.pstatic.net/main_3400955/34009552690.20221019105800.jpg','여행','상상출판','따뜻한 시선으로 바라본 일상 속 뉴욕 이야기

뉴욕에서의 일상을 기록한 브이로그로 많은 사랑을 받고 있는 유튜버 하루데이. 감성적이고 따스한 저자 특유의 시선을 담은 영상으로 누적 조회 수 1500만을 기록하며 뉴욕의 낭만을 공유하고 있다. 『뉴욕에 살고 있습니다』에는 그런 저자가 길을 걷다가 멈추어 서서 바라본 뉴욕의 풍경들을 담았다. 한곳에 오래 머물기보다 여러 나라를 경험하기를 좋아하는 저자는 3년간 살던 싱가포르를 떠나기로 결심했다. 다음 목적지를 고민하다가 망설임 없이 선택한 곳이 바로 뉴욕. 왠지 특별한 일상이 기다리고 있을 것만 같은 강한 끌림 때문이었다.
이름만 들어도 가슴이 뛰는 센트럴파크가 집 앞에 있다는 것, 좋아하는 영화와 드라마 속에 등장하는 뉴욕의 거리를 걸으며 다시금 이 도시와 사랑에 빠지는 것. 낭만 가득한 풍경이 어디에나 펼쳐져 있는 뉴욕은 기대만큼이나 아름다웠다. 저자의 카메라에 담긴 도시의 풍경은 마치 영화의 스틸컷 같고, 단정하고 담백한 문장들은 정제된 대사처럼 느껴진다. 평범할 수 있는 일상의 기록도 저자의 앵글을 통해 본 뉴욕에서라면 특별하다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (6,'남궁성','Java의 정석 (최신 Java 8.0 포함)',27000,to_date('16/01/27','RR/MM/DD'),9788994492032,'https://shopping-phinf.pstatic.net/main_3246668/32466681076.20221019150710.jpg','IT','도우출판','자바의 기초부터 실전활용까지 모두 담다!

자바의 기초부터 객제지향개념을 넘어 실전활용까지 수록한『Java의 정석』. 저자의 오랜 실무경험과 강의한 내용으로 구성되어 자바를 처음 배우는 초보자들의 궁금한 점을 빠짐없이 담고 있다. 더불어 기존의 경력자들을 위해 자바 최신기능인 람다와 스트림과 그 밖의 자바의 최신버젼 JAVA8의 새로운 기능까지 자세하게 설명하고 있다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (7,'유홍준','나의 문화유산답사기 11 : 서울편 3 (사대문 안동네 : 내 고향 서울 이야기)',19800,to_date('22/10/25','RR/MM/DD'),9788936479190,'https://shopping-phinf.pstatic.net/main_3536755/35367558621.20221027194716.jpg','역사','창비','서울의 어제와 오늘을 거쳐
‘답사기’ 서울편 드디어 완간!

초대형 베스트셀러이자 한국 인문서를 대표하는 시리즈 『나의 문화유산답사기』가 서울편 완간 소식을 가지고 돌아왔다. 시리즈 중에서도 큰 사랑을 받았던 서울편 1~2권 출간 이후 중국편 3권을 거쳐 5년 만에 서울편 3~4권으로 찾아온 것이다. 이번에 출간되는 서울편 3권 ‘사대문 안동네: 내 고향 서울 이야기’와 4권 ‘강북과 강남: 한양도성 밖 역사의 체취’는 세계인이 사랑하는 도시 서울의 오래된 동네와 뜻깊은 문화유산을 탐방하고 그곳의 매력적인 이력을 풀어내며 서울편 대장정을 마무리한다.

수도 600년의 오랜 세월 동안 서울은 점차 넓어지고 깊어져왔다. 저자는 지난 1~2권에 이어서 대도시 서울의 어제와 오늘을 섬세하게 통찰하는 한편, 지금까지 서울을 만들어왔고 거기서 삶을 이어나간 사람들의 이야기로 이번 3~4권을 채웠다. 특히 근현대 격변기를 거치며 오늘의 서울이 형성된 내력을 보여주는 명소들을 꼼꼼하게 둘러보고, 우리가 잘 몰랐던 골목골목의 이야기를 증언하고 되살리는 데 역점을 두었다. 특유의 관록과 입담은 물론, 일평생 ‘서울토박이’로 살아온 저자의 깊은 서울 사랑을 느낄 수 있다. 이번 3~4권까지 총 4권으로 완간되는 ‘답사기 서울편’은 서울의 역사문화를 알고자 하는 독자들에게 명실상부 대표적인 안내서로 자리 잡을 것이다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (8,'제러미 블랙^올리버 래컴^마를렌 수아노^마리오 토렐리^제프리 리크먼','지중해 세계사 (세 대륙이 만나는 바다, 그 교류와 각축의 인류사)',25200,to_date('22/09/26','RR/MM/DD'),9791191432817,'https://shopping-phinf.pstatic.net/main_3465441/34654414622.20221019105949.jpg','역사','책과함께','데이비드 아불라피아와 석학 8인의 범세계적 프로젝트!
세 대륙을 잇는 거대한 바다에서 펼쳐진 반만 년 인류사

아시아·아프리카·유럽 대륙이 만나는 바다. 기독교·유대교·이슬람 3대 종교의 중심지이자, 이집트·미노스·미케네·그리스·에트루리아·로마·아랍 등 주요 문명이 탄생하고 스러져간 곳, 지중해. 세계적인 지중해사 연구자이자 2020년 울프슨 역사 상을 수상한 데이비드 아불라피아와 내로라하는 역사학자 8인이 지중해의 반만 년 역사를 포괄적으로 살펴보기 위해 힘을 모았다.

9인의 석학이 살펴본 지중해사는 기존의 관점과는 사뭇 다르게 펼쳐진다. 유럽 중심의 시각에서 탈피해 서아시아, 북아프리카 대륙의 이야기를 골고루 전하는 이 역사서에서 우리는 유럽의 알파벳이 서아시아의 페니키아 문자에 뿌리를 두고 있고, 유일신 신앙이 고대 이스라엘인에게서 나와 유대교·기독교·이슬람교의 핵심적인 요소가 됐음을 확인할 수 있다. 또한 지중해의 물리적 환경과 지리적 제약에 주목했던 역사가 페르낭 브로델의 관점과 달리, 지중해의 역사를 만들어온 ‘개인’의 역할에 주목해 더욱 역동적이고 풍성한 인류사를 완성해냈다. 나아가 장엄하고 아름다운 50장의 컬러 화보는 지중해의 변천사를 생동감 넘치게 보여준다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (9,'EBS 문명과 수학 제작팀','문명과 수학 (세상을 움직이는 비밀 수와 기하)',13500,to_date('14/01/28','RR/MM/DD'),9788960173538,'https://shopping-phinf.pstatic.net/main_3246697/32466979623.20221019152115.jpg','역사','민음인','수학은 세상의 모든 지식으로 들어가는 열쇠다!

세상을 움직이는 비밀, 수와 기하 『문명과 수학』. 2011년 ‘EBS 다큐프라임’ 5부작으로 제작된 ‘문명과 수학’을 바탕으로 엮은 책으로, ‘기술’과 ‘계산’이라는 수학에 대한 오해를 바로잡기 위해 세상에 왜 ‘수’라는 것이 탄생했는지, 그 뿌리로의 접근을 시도한다. 다시 말해, ‘보이지 않는 수’를 통해 눈에 보이는 기술과 문화를 발전시켜 문명을 탄생시킨 ‘진짜 수학’에 대해 이야기하고자 한다.

피타고라스, 유클리드, 라이프니츠, 뉴턴 등 수많은 수학자들이 만들어낸 문제가 단순히 난해하고 복잡한 수학 문제가 아니라, 자신의 사상을 표현하는 수단이자 세상을 앞으로 나아가게 하는 새로운 문명의 열쇠였음을 흥미로운 이야기와 이미지를 통해 들려준다. 한편, 원작에서는 다루지 않았던 ‘중세 학문의 메카’ 이슬람 부분을 추가 구성함으로써, 더욱 흥미로워진 수학의 세계로 안내한다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (10,'유철상','아름다운 사찰여행 (인생에 쉼표가 필요하다면 산사로 가라)',15210,to_date('20/08/18','RR/MM/DD'),9791190938396,'https://shopping-phinf.pstatic.net/main_3244178/32441789684.20221019142835.jpg','종교','상상출판','유네스코 세계유산 등재 ‘산사, 한국의 산지 승원’ 포함 총 56곳!
감성적인 에세이에 녹아든 사찰의 역사부터 최신 맛집·숙소 정보까지…
우리나라 최고의 테마 여행지 ‘사찰’을 제대로 즐길 수 있는 법 대공개!

유네스코 세계유산 등재 ‘산사, 한국의 산지 승원’ 포함 총 56곳!
나를 찾는 최고의 힐링 여행지, 사찰로 당신을 초대합니다!

사람들은 왜 걷고 또 걸으려 할까? 정확한 대답은 직접 걸어본 사람만이 할 수 있다. 걷기는 느리게 여행하는 최적의 방식이기 때문이다. 그리고 나를 찾는 사색의 공간으로 사찰만큼 좋은 곳이 또 있을까?
『아름다운 사찰여행』은 여행전문기자 출신 저자 유철상이 약 20년 동안 전국의 사찰을 찾아다니며 기록한 책이다. 전국의 산사 56곳을 휴식, 수행, 힐링, 인연 등 테마로 나눠 소개해, 누구나 자신에게 꼭 맞춘 사찰여행을 떠날 수 있는 것이 가장 큰 장점! 특히 이 책에는 유네스코 세계유산에 등재된 ‘산사, 한국의 산지 승원’ 7곳을 추가해 세계적으로 인정받는 산사의 아름다움까지 두루 느껴볼 수 있도록 했다.
우리 땅 어디를 가든 절이 없는 곳이 없다. 한민족의 삶을 함께해온 절 구석구석을 돌아보면 어느새 그곳에 ‘나’의 삶이 녹아 있음을 느끼게 된다. 오죽하면 ‘절로 절을 찾게 된다’는 말이 있으랴. 쉼표처럼 절을 느끼고 자신을 되돌아보는 공간을 찾아가는 여행. 그것은 곧 절을 찾는 의미일 것이다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (11,'황은경^김금희^김수정^김순조','사찰 요리 (육류와 오신채를 사용하지 않는 자연음식)',27000,to_date('15/04/10','RR/MM/DD'),9791157630646,'https://shopping-phinf.pstatic.net/main_3248502/32485025007.20220527022418.jpg','종교','백산출판사','이 책의 구성은 크게 이론편과 실기편으로 나뉘어 있다. 이론편의 1장은 사찰음식의 우수성과 종교성, 2장은 사찰음식의 분류, 3장은 주요 사찰의 대표음식으로 구성되어 있다. 또한 실기편에서는 음식을 마들기 위한 각종 레시피와 실제로 만든 음식을 사진으로 실어 음식이나 조리를 공부하는 대학생 및 일반 독자들도 쉽게 이해할 수 있도록 구성하였다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (12,'플레밍 러틀리지','부끄럽지 않은 복음 (플레밍 러틀리지의 로마서 설교)',13500,to_date('22/10/31','RR/MM/DD'),9791189092115,'https://shopping-phinf.pstatic.net/main_3534902/35349024624.20221027194708.jpg','종교','도서출판100','플레밍 러틀리지의 로마서 설교 모음집. 1978년부터 2006년까지 교회력에 따라 강론한 로마서 설교 중 51편을 선별하였다. 이 책에서 러틀리지는 로마서가 제시하는 복음이 급진적이고 혁명적임을 보여 준다. 풍부한 예시를 통해 오늘날의 언어로 로마서를 생생하게 조명하여, 그리스도인이 성경을 통해 자신과 세계를 바라보는 실제적인 관점을 제공한다.');
Insert into TBL_BOOK (BNO,AUTHOR,TITLE,DISCOUNT,PUBDATE,ISBN,IMAGE,CATEGORY,PUBLISHER,DESCRIPTION) values (13,'STUDIO SHIN','누구나 할 수 있는 유니티 2D 게임 제작 (유니티를 몰라도 따라 하면서 즐겁게 익히는 레트로풍 2D 게임 제작)',26100,to_date('22/10/04','RR/MM/DD'),9791192469263,'https://shopping-phinf.pstatic.net/main_3472407/34724077625.20221019150816.jpg','IT','제이펍','게임 개발, 유니티, 프로그래밍 모두 처음인 사람을 위한 단 한 권의 책. 중학교 수준의 영어와 수학, 그리고 ‘게임을 좋아하고 게임을 만들고 싶다’는 마음만 있다면 누구나 즐겁게 유니티 사용법을 익혀 2D 게임을 만들 수 있게 집필한 책이다. 게임 타이틀 표시로 시작해서 스테이지, 캐릭터, 게임 장치 등을 추가해 살을 붙여나감으로써, 사이드뷰(횡스크롤) 게임과 탑뷰 게임 두 가지 샘플 게임을 완성한다. 한 단계씩 실습하며 게임이 만들어지는 과정을 ‘즐겁게’ 익히고, 자신만의 게임을 완성해보자.');

select * from tbl_book;

create SEQUENCE seq_review;
create table tbl_review(
    reviewNo number(10,0),   -- 리뷰 번호    
    bno number(10,0) not null,  --게시글 번호    
    review varchar2(1000) not null,  -- 리뷰 내용
    reviewer varchar2(50) not null,  -- 리뷰 작성자   
    reviewDate date default sysdate, -- 리뷰 작성일   
    updateDate date default sysdate -- 리뷰 수정
);
-- rating(별점)추가 
alter table tbl_review add (rating number(2,1));
-- pk
alter table tbl_review add constraint pk_review primary key(reviewNo);
-- fk
alter table tbl_review add constraint fk_review foreign key(bno) references tbl_book(bno);
select * from tbl_review where bno = 1;
-- index 
create index idx_review on tbl_review(bno desc, reviewNo asc);
drop index idx_review;
alter table tbl_review drop constraint fk_review;
-- tbl_book에 reviewCnt 추가  
alter table tbl_book add (reviewCnt number default 0);
-- 기존의 리뷰    reviewCnt에 반영  
update tbl_book set reviewCnt = (select count(reviewNo) from tbl_review where tbl_review.boardNo = tbl_book.bno);
commit;

-- tbl_member
create table tbl_member(
    memberID varchar2(50),      -- 회원 아이디   
    memberPW varchar2(100),     -- 회원 비밀번호  
    memberName varchar2(30),    -- 회원 이름    
    memberMail varchar2(100),   -- 회원 메일    
    memberAddr1 varchar2(100),  -- 회원 주소1
    memberAddr2 varchar2(100),  -- 회원 주소2   
    memberAddr3 varchar2(100),  -- 회원 주소3
    regDate date default sysdate    -- 회원가입일  
);
alter table tbl_member add constraint pk_member primary key(memberId);
--alter table tbl_reply add memberID varchar2(50);
--alter table tbl_review add memberID varchar2(50);
--alter table tbl_board add memberID varchar2(50);
--alter table tbl_book add memberID varchar2(50);

alter table tbl_reply add constraint fk_reply_member foreign key(replyer) references tbl_member(memberID);
alter table tbl_review add constraint fk_review_member foreign key(memberID) REFERENCES tbl_member(memberID);
alter table tbl_board add constraint fk_member_board foreign key(writer) REFERENCES tbl_member(memberID);   
alter table tbl_book add constraint fk_member_book foreign key(memberID) REFERENCES tbl_member(memberID);

alter table tbl_book drop constraint fk_member_book;

select * from tbl_member;
select * from tbl_reply where replyer not in (select memberID from tbl_member);
delete from tbl_reply;
-- tbl_cart
create table tbl_cart(
    cartBno number(20,0),
    bno number(20,0),
    title varchar2(200),
    discount number(20,0),
    category varchar2(20),
    image varchar2(300),
    count number(10,0)
);
alter table tbl_cart add constraint pk_cart primary key(cartBno);
alter table tbl_cart add constraint fk_cart foreign key(bno) references tbl_book(bno);
commit;
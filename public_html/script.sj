// 각 퍼즐 칸에 입력된 내용을 저장할 객체
let puzzleContents = {};

// 첫 화면에서 설명을 숨기고 퍼즐 화면을 보여주는 함수
function startPuzzle() {
    document.getElementById('intro').style.display = 'none'; // 설명 페이지 숨기기
    document.getElementById('puzzleSection').style.display = 'block'; // 퍼즐 페이지 보여주기
}

function openForm(itemId) {
    const itemElement = document.getElementById(`item${itemId}`); // 수정된 부분

    // 이미 컬러로 변경된 경우에는 내용을 보여줍니다
    if (itemElement.classList.contains('filled')) {
        alert(`이 친구는 이런 이야기로 여러분과 연대하려고 해요! "${puzzleContents[itemId]}"`); // 수정된 부분
        return; // 이미 채워진 경우 폼을 열지 않음
    }

    // 숨겨진 폼을 보여줍니다
    document.getElementById('contentForm').style.display = 'block';
    document.getElementById('contentForm').setAttribute('data-current-item', itemId);
}

function submitContent() {
    // 사용자 입력을 가져옵니다
    const userContent = document.getElementById('userContent').value;
    const itemId = document.getElementById('contentForm').getAttribute('data-current-item');
    const itemElement = document.getElementById(`item${itemId}`); // 수정된 부분

    if (userContent.trim() !== '') {
        // 입력된 내용을 저장합니다
        puzzleContents[itemId] = userContent;
        
        // 퍼즐 칸을 컬러 이미지로 변경합니다
        itemElement.classList.add('filled');
        itemElement.style.backgroundImage = `url('images/piece${itemId}_color.jpg')`; // 수정된 부분
    }

    // 폼을 숨기고 초기화합니다
    document.getElementById('contentForm').style.display = 'none';
    document.getElementById('userContent').value = '';
}

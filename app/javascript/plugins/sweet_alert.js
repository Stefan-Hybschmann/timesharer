import swal from 'sweetalert'

const sweet = () => {
  const button = document.querySelector(".sweet")
  button.addEventListener("click", (event) => {
    swal({
      title: 'Success',
      text: 'Your invitation has been sent',
      icon: "success"
    })
  })
}


export { sweet };

const showBookingConfirmationModal = () => {
  const modalEl = $("#booking-confirmation-modal")
  if (modalEl) {
    modalEl.modal()
  }
}

export { showBookingConfirmationModal }

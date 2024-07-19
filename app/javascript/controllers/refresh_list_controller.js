import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh-list"
export default class extends Controller {
  static targets = ["form", "list", "searchInput"]

  connect() {
    this.updateList()
  }

  updateList() {
    const url = this.formTarget.action
    const query = this.searchInputTarget.value
    const params = new URLSearchParams({ query: query })

    fetch(`${url}?${params}`, { headers: { 'Accept': 'text/javascript' } })
      .then(response => response.text())
      .then(html => {
        this.listTarget.innerHTML = html
      })
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.updateList()
    }, 300)
  }
}

import ApplicationController from './application_controller'

export default class extends ApplicationController {
  connect () {
    super.connect()
  }

  increment() {
    this.stimulate('Counter#increment', 4)
  }
}

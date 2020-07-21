import axios from 'axios'

function testService () {
    console.log('Test service called, axios:', axios.request);
}

export const beService = {
    testService,
}
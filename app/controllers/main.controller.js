const mainController = {
    homepage (req,res) {
        res.send(`Hello World !`);
    },

    catalog (req,res) {
        res.send(`Page Catalogue`);
    }
};

export default mainController
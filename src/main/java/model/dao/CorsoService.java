package model.dao;

import model.session.Corso;

public class CorsoService extends AbstractService<CorsoDAO, Corso>{

    @Override
    public CorsoDAO createDAO() {
        // TODO Auto-generated method stub
        return new CorsoDAO();
    }
}



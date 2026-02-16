import java.awt.*;
import java.awt.event.*;

class MyAWT extends Frame implements ActionListener {

    Button b1, b2;
    Label l;

    MyAWT() {

        b1 = new Button("A");
        b2 = new Button("B");
        l = new Label("");
        l.setPreferredSize(new Dimension(700, 30));
        l.setAlignment(Label.CENTER);

        add(b1);
        add(b2);
        add(l);

        setLayout(new FlowLayout());
        
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                dispose();
                System.exit(0);
            }
        });

        setSize(750, 120);
        setVisible(true);
    }
    
    void init() {
        b1.addActionListener(this);
        b2.addActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if(e.getSource() == b1)
            l.setText("Name: Vivek | Course: MSc CS | Roll: 101 | MIT-WPU");

        else if(e.getSource() == b2)
            l.setText("CGPA: 8.5");
    }

    @SuppressWarnings("unused")
    public static void main(String args[]) {
        MyAWT obj = new MyAWT();   // stored reference
        obj.init();
    }
}
